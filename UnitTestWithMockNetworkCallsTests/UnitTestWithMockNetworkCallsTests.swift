//
//  UnitTestWithMockNetworkCallsTests.swift
//  UnitTestWithMockNetworkCallsTests
//
//  Created by Tatsuya Moriguchi on 6/26/22.
//

import XCTest
@testable import UnitTestWithMockNetworkCalls

class UnitTestWithMockNetworkCallsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testDecodingMockData() {
        let expectation = self.expectation(description: "\(#file), \(#function): WaitForDecordingMockData")
        // using the data constant we jsut created.
        let mockDataLoader = MockDataLoader(
            data: data,
            response: nil,
            error: nil
        )
        let request = URLRequest(url:  URL(string: "www.google.com")!)
        mockDataLoader.loadData(using: request) { (data, nil, error) in
            XCTAssertNotNil(mockDataLoader.data)
            XCTAssertNil(mockDataLoader.response)
            XCTAssertNil(mockDataLoader.error)
            let decoder = JSONDecoder()
            let dictionary = try? decder.decode([String:String].self, from: mockDataLoader.data!)
            let money = dictionary?["money"]
            XCTAssertNotNil(Int(money!))
            
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

}
