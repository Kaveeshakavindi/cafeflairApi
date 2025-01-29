//
//  CreateCoffee.swift
//  cafeflair_api
//
//  Created by Kaveesha Fernando on 2025-01-29.
//

import Fluent

//what is migration?
//it is a databse schema definition that tells fluent how to create and manage the coffees table in postgresSQL
//why we need migrations in vapor:
//1. create tables in the database
//2.modify schema (add, update, delete)
//3.rollback changes if needed

//when create coffees runs it creates a table named coffees with the followinf columns:
///id    UUID    Auto-generated
//name    String    Required
//description    String    Required
//image_url    String    Required
//price    Double    Required
//quantity    Int    Required

//automates database setups
//With Fluent, we don’t have to write SQL—just swift

//If you need to remove the table, you call:
//vapor run revert
//which will trigger:
//func revert(on database: Database) async throws {
//try await database.schema("coffees").delete()
//}

//How to Apply the Migration?
//Register the migration in configure.swift:
//app.migrations.add(CreateCoffee())
//Run the migration:
//vapor run migrate

struct CreateCoffee: AsyncMigration{
    func prepare(on database: Database) async throws{
        try await database.schema("coffees")
            .id()
            .field("name", .string, .required)
            .field("description", .string, .required)
            .field("image_url", .string, .required)
            .field("price", .double, .required)
            .field("quantity", .int, .required)
            .create()
    }
    
    func revert(on database: any Database) async throws {
        try await
        database.schema("coffees").delete()
    }
}



