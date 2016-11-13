//
//  AdventureTests.swift
//  AdventureTests
//
//  Created by james on 01/11/2016.
//  Copyright © 2016 James. All rights reserved.
//

import XCTest
@testable import Adventure

class AdventureTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let controller = ViewController()
        
        XCTAssertTrue(controller.minusScore(a: 15, b: 7) == 200)
        XCTAssertTrue(controller.minusScore(a: 155, b: 88) == 300 )
    }
    
}
