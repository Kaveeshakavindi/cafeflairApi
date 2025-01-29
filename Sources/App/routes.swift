import Vapor

func routes(_ app: Application) throws {
    

    app.get("coffees"){req async throws in
        try await Coffee.query(on: req.db).all()
    }
    
}
