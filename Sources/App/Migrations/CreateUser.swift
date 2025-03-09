//
//  CreateUser.swift
//  cafeflair_api
//
//  Created by Kaveesha Fernando on 2025-01-30.
//

import Fluent

struct CreateUser: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("users", space: "sc_coffees")
            .id()
            .field("name", .string, .required)
            .field("email", .string, .required)
            .field("password", .string, .required)
            .field("created_at", .datetime)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("users", space: "sc_coffees").delete()
    }
}
