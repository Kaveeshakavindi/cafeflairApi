//
//  UserPayload.swift
//  cafeflair_api
//
//  Created by Kaveesha Fernando on 2025-03-09.
//

import JWTKit
import Vapor

struct UserPayload: JWTPayload{
    let id: UUID?
    let email: String
    let exp: ExpirationClaim
    
    func verify(using signer: JWTSigner) throws{
        try exp.verifyNotExpired()
    }
}
