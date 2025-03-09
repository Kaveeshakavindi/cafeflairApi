//
//  CoffeeControler.swift
//  cafeflair_api
//
//  Created by Kaveesha Fernando on 2025-03-09.
//
import Vapor

struct CoffeeControler{
    var session: URLSession
    //get all coffees
    func getCoffees(_ req: Request) async throws -> [Coffee] {
            return try await Coffee.query(on: req.db).all()
        }
    
    func getCoffee(completion: @escaping([Coffee]?, Error?) -> Void){
        guard let url = URL(string:
        "https://cafeflair.com/coffees")
        else{fatalError()}
        session.dataTask(with: url) {(data, response, error) in guard
            let data = data else {return}
            let coffees = try!
            JSONDecoder().decode([Coffee].self, from: data)
            completion(coffees, nil)
        }.resume()
    }
}
