import Vapor
import Fluent
import FluentPostgresDriver

public func configure(_ app: Application) async throws {
    try app.databases.use(.postgres(url: "postgresql://kaveeshafernando:56734@localhost:5432/postgres"), as: .psql)
    
//    app.databases.use(.postgres(
//        configuration: .init(
//            hostname: "localhost",
//            username: "kaveeshafernando",
//            password: "56734",
//            database: "postgres",
//            tls: .disable
//        ),
//        maxConnectionsPerEventLoop: 10,
//        connectionPoolTimeout: .seconds(30),
//        encodingContext: .default,
//        decodingContext: .default,
//        sqlLogLevel: .info
//    ), as: .psql)
    //app.migrations.add(CreateCoffee())
    //try await app.autoMigrate()
    try routes(app)
}
