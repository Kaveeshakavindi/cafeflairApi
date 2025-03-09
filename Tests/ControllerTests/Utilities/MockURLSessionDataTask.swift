//
//  MockURLSessionDataTask.swift
//  cafeflair_api
//
//  Created by Kaveesha Fernando on 2025-03-09.
//

import Foundation

class MockURLSessionDataTask : URLSessionDataTask{
    private let completionHandler: () -> Void
    init(completionHandler: @escaping () -> Void){
        self.completionHandler = completionHandler
    }
    
    override func resume(){
        completionHandler()
    }
}

