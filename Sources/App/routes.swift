import Vapor
import NetFunCore

func routes(_ app: Application) throws {
    let api = app.grouped("api")
    try api.grouped(Endpoints.Profiles.root.toPathComponents).register(collection: ProfileController())
    try api.grouped(Endpoints.ProfileHome.root.toPathComponents).register(collection: ProfileHomeController())
}
