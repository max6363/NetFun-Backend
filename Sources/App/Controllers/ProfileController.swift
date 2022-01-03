//
//  File.swift
//  
//
//  Created by Minhaz on 29/12/21.
//

import Fluent
import Vapor
import NetFunCore

struct ProfileController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.on(Endpoints.Profiles.getAll, use: getAllHandler)
    }
    
    func getAllHandler(req: Request) throws -> [UserAPIModel] {
        do {
            let resposne = try ProfileController.getAllProfiles()
            return resposne
        } catch {
            print("getAllHandler: error: \(error)")
            throw NetFunError.other(description: "Eror fetching profiles: \(error.localizedDescription)")
        }
    }
}

extension ProfileController {
    
    static func getAllProfiles() throws -> [UserAPIModel] {
        let dummyProfilesResponseJSONString = """
        [
            {
                "id": 1,
                "name": "John Doe",
                "username": "john32"
            },
            {
                "id": 2,
                "name": "Mike Hanigan",
                "username": "mikeH"
            },
            {
                "id": 3,
                "name": "Max Payne",
                "username": "max-8000"
            },
            {
                "id": 4,
                "name": "ZK Bill",
                "username": "zkb1212"
            },
            {
                "id": 5,
                "name": "Sarah M.",
                "username": "sarah"
            }
        ]
        """
        do {
            let profiles = try JSONDecoder().decode([UserAPIModel].self,
                                                    from: dummyProfilesResponseJSONString.data(using: .utf8)!)
            return profiles
        } catch {
            print("parsing error", error)
            throw NetFunError.other(description: "Json can not be parsed")
        }
    }
}
