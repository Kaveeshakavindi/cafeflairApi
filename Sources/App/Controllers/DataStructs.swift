//
//  DataStructs.swift
//  cafeflair_api
//
//  Created by Kaveesha Fernando on 2025-03-09.
//

import Vapor

struct LoginData: Content{
    let email: String
    let password: String
}
