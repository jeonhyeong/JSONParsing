//
//  JSONParsingTests.swift
//  JSONParsingTests
//
//  Created by 조전형 on 2019/07/07.
//  Copyright © 2019 cho. All rights reserved.
//

import XCTest
@testable import JSONParsing

class JSONParsingTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTemp() {
        let absoluteTemperature:Float = 298.0
        let viewController = ViewController()
        let temp = viewController.getCelsius(temp: absoluteTemperature)
        XCTAssertEqual(temp, Int(absoluteTemperature - 273.15))
    }
}
