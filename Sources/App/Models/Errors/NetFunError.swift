//
//  File.swift
//  
//
//  Created by Minhaz on 29/12/21.
//

import Vapor

public struct NetFunError: Error {
    
    public enum ErrorIdentifier: String, Codable {
        case missingParameter
        case other
    }
    
    public let errorIdentifer: ErrorIdentifier
    public let reason: String
    
    public static func missingParameter(name: String) -> NetFunError {
        NetFunError(
            errorIdentifier: .missingParameter,
            reason: "Parameter \(name) is missing"
        )
    }
    
    public static func other(description: String) -> NetFunError {
        NetFunError(errorIdentifier: .other, reason: "Other error: \(description)")
    }
    
    public init(errorIdentifier: ErrorIdentifier, reason: String) {
        self.errorIdentifer = errorIdentifier
        self.reason = reason
    }
}

extension NetFunError: AbortError {
    public var status: HTTPResponseStatus {
        switch self.errorIdentifer {
            
        case .missingParameter:
            return .badRequest
        case .other:
            return .internalServerError
        }
    }
}

// MARK: - NetFunErrorResponse

extension NetFunError: DebuggableError {
    public var identifier: String { errorIdentifer.rawValue }
}

public struct NetFunErrorResponse: Codable {
    public let error: String
    public let identifier: NetFunError.ErrorIdentifier
    public let reason: String
    public let statusCode: UInt
    
    public init(
        identifier: NetFunError.ErrorIdentifier,
        reason: String,
        statusCode: UInt
    ) {
        self.error = "true"
        self.identifier = identifier
        self.reason = reason
        self.statusCode = statusCode
    }
}

extension NetFunError {
    public init(_ errorResponse: NetFunErrorResponse) {
        self.init(errorIdentifier: errorResponse.identifier,
                  reason: errorResponse.reason)
    }
}

extension NetFunErrorResponse {
    init(_ error: NetFunError) {
        self.init(identifier: error.errorIdentifer,
                  reason: error.reason,
                  statusCode: error.status.code)
    }
}
