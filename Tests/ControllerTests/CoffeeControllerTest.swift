//
//  CoffeeControllerTest.swift
//  cafeflair_api
//
//  Created by Kaveesha Fernando on 2025-03-09.
//

import XCTest
@testable import App
import Vapor

final class CoffeeControllerTest: XCTestCase{
    
    //test case 1 : get coffees with expected URL
//    func testGetCoffeesWithExpectedURLHostAndPath(){
//        let mockURLSession = MockURLSession()
//        let coffeeController = CoffeeControler(session: mockURLSession)
//        
//        coffeeController.getCoffee{coffees, error in}
//        XCTAssertEqual(mockURLSession.cachedUrl?.host, "cafeflair.com")
//        XCTAssertEqual(mockURLSession.cachedUrl?.path, "/coffees")
//    }
    
    //test case 2 : get coffees from API
    func testGetCoffeesSuccessReturnsCoffees(){
        let jsonData = "[{\"price\": 6,\"description\": \"Espresso poured over vanilla ice cream\", \"quantity\":30, \"name\":\"Affogato\", \"id\":1, \"imageUrl\": \"s3://cafeflairawsbucket/cafeflair_coffees/Affogato.png\"}]".data(using: .utf8)
        let mockURLSession = MockURLSession(data: jsonData, urlResponse: nil, error: nil)
        let coffeeController = CoffeeControler(session: mockURLSession)
        let coffeesExpectation = expectation(description: "coffees")
        var coffeesResponse: [Coffee]?
        
        coffeeController.getCoffee{(coffees, error) in coffeesResponse = coffees
            coffeesExpectation.fulfill()
        }
        waitForExpectations(timeout: 1) { (error) in
            XCTAssertNotNil(coffeesResponse)
          }
    }
}
