//
//  MockTask.swift
//  cafeflair_api
//
//  Created by Kaveesha Fernando on 2025-03-09.
//
//mock task to hold response details
import Foundation

class MockTask{
    let data: Data?
    let urlResponse: URLResponse?
    let error: Error?
    var completionHandler: ((Data?, URLResponse?, Error?) -> Void)?
    
    init(data: Data?, urlResponse: URLResponse?, error: Error?){
        self.data = data
        self.urlResponse = urlResponse
        self.error = error
    }
}
