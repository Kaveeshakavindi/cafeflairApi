import XCTest
import Vapor
@testable import App

final class AppTests: XCTestCase {
    var app: Application!

    

    func getCoffeesTest() async throws {
        let url = URL(string: "http://127.0.0.1:8080/coffees")!
        let dataAndResponse: (data: Data, response: URLResponse) = try await URLSession.shared.data(from: url, delegate: nil)
        let httpResponse = try XCTUnwrap(dataAndResponse.response as? HTTPURLResponse, "Expected an HTTPURLResponse.")
        XCTAssertEqual(httpResponse.statusCode, 200, "Expected a 200 OK response.")
    }
    
    func postUserLoginTest() async throws{
        let url = URL(string: "http://127.0.0.1:8080/login")
    }
}
