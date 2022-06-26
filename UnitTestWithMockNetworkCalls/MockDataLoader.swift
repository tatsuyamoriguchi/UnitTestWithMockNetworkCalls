//
//  MockDataLoader.swift
//  UnitTestWithMockNetworkCalls
//
//  Created by Tatsuya Moriguchi on 6/26/22.
//

import Foundation

protocol NetworkLoader {
    func loadData(using request: URLRequest, with completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}

class MockDataLoader: NetworkLoader {

    
    let data: Data?
    let response: URLResponse?
    let error: Error?
    
    init(data: Data?, response: URLResponse?, error: Error?) {
        self.data = data
        self.response = response
        self.error = error
    }
    
    private(set) var request: URLRequest?
   
    func loadData(using request: URLRequest, with completion: @escaping (Data?, URLResponse?, Error? ) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.005) {
            self.request = request
            completion(self.data, self.response, self.error)
        }
    }
    
}
    
//let data = """
//{
//"money": "1000"}
//""".data(using: .utf8)!

