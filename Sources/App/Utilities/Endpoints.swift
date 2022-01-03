//
//  File.swift
//  
//
//  Created by Minhaz on 29/12/21.
//

import Vapor

public struct Endpoints {
    
    public struct RouteDefinition {
        public enum HTTPMethod: String {
            case GET
            case POST
            case PUT
            case PATCH
            case DELETE
        }
        
        public let root: [String]
        public let method: RouteDefinition.HTTPMethod
        public let path: [String]
        
        var httpMethod: Vapor.HTTPMethod { .init(rawValue: method.rawValue) }
        var pathComponents: [Vapor.PathComponent] { path.toPathComponents }
        var rootComponents: [Vapor.PathComponent] { root.toPathComponents }
    }
    
    public struct Profiles {
        public static let root = ["profiles"]
        public static let getAll = RouteDefinition(root: root, method: .GET, path: [])
    }
    
    public struct ProfileHome {
        public static let root = ["profilehome"]
        public static let getAll = RouteDefinition(root: root, method: .GET, path: [":profileID"])
    }
    
//    public struct Movies {
//        public static let root = ["movies"]
//        public static let getAll = RouteDefinition(root: root, method: .GET, path: [])
//        public static let getByUser = RouteDefinition(root: root, method: .GET, path: [":userID"])
//    }
}

extension Array where Element == String {
    var toPathComponents: [PathComponent] { self.map(PathComponent.init) }
}

extension RoutesBuilder {
    @discardableResult
    public func on<Response>(
      _ routeDefinition: Endpoints.RouteDefinition,
      use closure: @escaping (Request) throws -> Response
    ) -> Route where Response: ResponseEncodable {
      self.on(routeDefinition.httpMethod, routeDefinition.pathComponents, use: closure)
    }
}

