//
//  GenerateJWTToken.swift
//  cafeflair_api
//
//  Created by Kaveesha Fernando on 2025-03-09.
//

import JWTKit

struct GenerateJWTToken{
    func generateToken (for user: User) throws -> String{
        let payload = UserPayload(
            id: user.id,
            email: user.email,
            exp: .init(value: .init(timeIntervalSinceNow: 3600))
        )
        let  token = try JWTSigner.hs256(key: "#56734").sign(payload)
        return token
    }
}
