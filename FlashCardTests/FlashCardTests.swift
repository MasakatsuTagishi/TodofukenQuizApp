//
//  FlashCardTests.swift
//  FlashCardTests
//
//  Created by 田岸将勝 on 2021/11/04.
//

import XCTest
@testable import FlashCard

class FlashCardTests: XCTestCase {

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
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCountUp() {
        let answer = Calculator.countUp(count: 1, addCount: 1)
        XCTAssertEqual(answer, 2)
    }

}
