//
//  MockURLSession.swift
//  cafeflair_api
//
//  Created by Kaveesha Fernando on 2025-03-09.
//

import Foundation

class MockURLSession: URLSession {
  var cachedUrl: URL?
  override func dataTask(with url: URL, completionHandler:      @escaping(Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
    self.cachedUrl = url
    return URLSessionDataTask()
  }
}
