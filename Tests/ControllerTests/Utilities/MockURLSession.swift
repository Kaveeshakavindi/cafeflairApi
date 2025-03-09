//
//  MockURLSession.swift
//  cafeflair_api
//
//  Created by Kaveesha Fernando on 2025-03-09.
//

import Foundation

class MockURLSession: URLSession {
    private let mockTask : MockTask
    private var cachedUrl: URL?
    
    init(data: Data?, urlResponse: URLResponse?, error: Error?) {
        self.mockTask = MockTask(data: data, urlResponse: urlResponse, error: error)
    }
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        self.cachedUrl = url
        mockTask.completionHandler = completionHandler
        return MockURLSessionDataTask {
            completionHandler(self.mockTask.data, self.mockTask.urlResponse, self.mockTask.error)
        }
    }
}
