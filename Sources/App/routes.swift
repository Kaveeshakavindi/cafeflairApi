import Vapor
import Fluent
import JWTKit

func routes(_ app: Application) throws {
    let mockURLSession = MockURLSession()
    let coffeeController = CoffeeControler(session: mockURLSession)
    let userController = UserController()
    
    //register the route to hanlde GET
    app.get("coffees") { req async throws -> [Coffee] in
            try await coffeeController.getCoffees(req)
        }

    //register a user
    app.post("register") { req async throws -> User in
            try await userController.registerUser(req)
        }
    
    //login user
    app.post("login") { req async throws -> String in
        try await userController.loginUser(req)
        }
}


