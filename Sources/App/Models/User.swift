//
//  User.swift
//  cafeflair_api
//
//  Created by Kaveesha Fernando on 2025-01-30.
//

import Vapor
import Fluent

final class User: Model, Content{
    static let schema = "users"
    public static let space: String? = "sc_coffees"
    
    @ID(custom: .id)
    var id: UUID?
        
        @Field(key: "name")
        var name: String
        
        @Field(key: "email")
        var email: String
        
        @Field(key: "password")
        var password: String //store hashed password
        
        @Timestamp(key: "created_at", on: .create)
        var createdAt: Date?
        
        init() {}

    init(id: UUID? = nil, name: String, email: String, password: String) {
            self.id = id
            self.name = name
            self.email = email
            self.password = password
        }
    
}
