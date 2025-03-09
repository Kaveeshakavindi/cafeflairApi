//
//  UserController.swift
//  cafeflair_api
//
//  Created by Kaveesha Fernando on 2025-03-09.
//

import Vapor
import Fluent

struct UserController{
    let generateTokenStruct = GenerateJWTToken()
    
    //register user
    func registerUser(_ req: Request) async throws -> User {
            let userData = try req.content.decode(User.self)
            let hashedPassword = try Bcrypt.hash(userData.password)
            let user = User(name: userData.name, email: userData.email, password: hashedPassword)
            try await user.save(on: req.db)
            return user
        }
    
    //login user
    func loginUser(_ req: Request) async throws ->
    String{
        let loginData = try req.content.decode(LoginData.self)
                
                // Find user by email
        guard let user = try await User.query(on: req.db)
                    .filter(\.$email == loginData.email)
                    .first() else {
                    throw Abort(.unauthorized, reason: "Invalid email or password")
        }
        //verify password
        let isValidPassword = try Bcrypt.verify(loginData.password, created: user.password)
        guard isValidPassword else {
            throw Abort(.unauthorized, reason: "Invalid email or password")
        }
        //generate token
        let token = try generateTokenStruct.generateToken(for: user)
        return token
    }
}
