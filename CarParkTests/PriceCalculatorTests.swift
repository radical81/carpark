//
//  PriceCalculatorTests.swift
//  CarPark
//
//  Created by Rex Jason Alobba on 17/6/17.
//  Copyright © 2017 Rex Jason Alobba. All rights reserved.
//

import XCTest
@testable import CarPark

class PriceCalculatorTests: XCTestCase {

    let priceCalculator = PriceCalculator()
    let rate = Rate(data: [
        "name": "Standard Rate",
        "type":"Hourly Rate",
        "type_code":"hourly",
        "prices":[["min": 0, "max":1, "price": 5], ["min": 1, "max":2, "price": 10], ["min": 2, "max":3, "price": 15], ["min": 3, "max":-1, "price": 20]]
        ]
    )
    
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
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCalculatePricegiven20170617_700pm_20170617_701pm_return5() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy h:mm a"
        let entryDate = formatter.date(from: "17/06/2017 7:00 PM")
        let exitDate = formatter.date(from: "17/06/2017 7:01 PM")
        XCTAssertEqual(priceCalculator.calculatePrice(enter: entryDate!, leave: exitDate!, rate: rate), 5)
    }    
    
    func testCalculatePricegiven20170617_700pm_20170617_800pm_return5() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy h:mm a"
        let entryDate = formatter.date(from: "17/06/2017 7:00 PM")
        let exitDate = formatter.date(from: "17/06/2017 8:00 PM")
        XCTAssertEqual(priceCalculator.calculatePrice(enter: entryDate!, leave: exitDate!, rate: rate), 5)
    }
    
    func testCalculatePricegiven20170615_700pm_20170615_900pm_return10() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy h:mm a"
        let entryDate = formatter.date(from: "15/06/2017 7:00 PM")
        let exitDate = formatter.date(from: "15/06/2017 9:00 PM")
        XCTAssertEqual(priceCalculator.calculatePrice(enter: entryDate!, leave: exitDate!, rate: rate), 10)
    }

    func testCalculatePricegiven20170615_700pm_20170615_1100pm_return20() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy h:mm a"
        let entryDate = formatter.date(from: "15/06/2017 7:00 PM")
        let exitDate = formatter.date(from: "15/06/2017 11:00 PM")
        XCTAssertEqual(priceCalculator.calculatePrice(enter: entryDate!, leave: exitDate!, rate: rate), 20)
    }
    
    func testCalculatePricegiven20170615_700pm_20170616_1100pm_return40() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy h:mm a"
        let entryDate = formatter.date(from: "15/06/2017 7:00 PM")
        let exitDate = formatter.date(from: "16/06/2017 11:00 PM")
        XCTAssertEqual(priceCalculator.calculatePrice(enter: entryDate!, leave: exitDate!, rate: rate), 40)
    }
}
