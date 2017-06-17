//
//  RateSelectorTests.swift
//  CarPark
//
//  Created by Rex Jason Alobba on 17/6/17.
//  Copyright © 2017 Rex Jason Alobba. All rights reserved.
//

import XCTest
@testable import CarPark

class RateSelectorTests: XCTestCase {
    let rateSelector = RateSelector()
    
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
    
    func testSelectRate_given20170615_700pm_20170615_900pm_returnStandardRate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy h:mm a"
        let entryDate = formatter.date(from: "15/06/2017 7:00 PM")
        let exitDate = formatter.date(from: "15/06/2017 9:00 PM")
        let rate = rateSelector.selectRate(enter: entryDate!, leave: exitDate!)
        XCTAssertEqual(rate.name, "Standard Rate")
    }
    
    func testSelectRate_given20170615_900am_20170615_330pm_returnEarlyBirdRate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy h:mm a"
        let entryDate = formatter.date(from: "15/06/2017 9:00 AM")
        let exitDate = formatter.date(from: "15/06/2017 3:30 PM")
        let rate = rateSelector.selectRate(enter: entryDate!, leave: exitDate!)
        XCTAssertEqual(rate.name, "Early Bird")
    }
    
    func testSelectRate_given20170615_700am_20170615_330pm_returnEarlyBirdRate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy h:mm a"
        let entryDate = formatter.date(from: "15/06/2017 7:00 AM")
        let exitDate = formatter.date(from: "15/06/2017 3:30 PM")
        let rate = rateSelector.selectRate(enter: entryDate!, leave: exitDate!)
        XCTAssertEqual(rate.name, "Early Bird")
    }

    func testSelectRate_given20170615_700pm_20170616_600am_returnNightRate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy h:mm a"
        let entryDate = formatter.date(from: "15/06/2017 7:00 PM")
        let exitDate = formatter.date(from: "16/06/2017 5:59 AM")
        let rate = rateSelector.selectRate(enter: entryDate!, leave: exitDate!)
        XCTAssertEqual(rate.name, "Night Rate")
    }

    func testSelectRate_given20170616_1100pm_20170617_1100am_returnNightRate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy h:mm a"
        let entryDate = formatter.date(from: "16/06/2017 11:00 PM")
        let exitDate = formatter.date(from: "17/06/2017 5:00 AM")
        let rate = rateSelector.selectRate(enter: entryDate!, leave: exitDate!)
        XCTAssertEqual(rate.name, "Night Rate")
    }
    
    func testSelectRate_given20170617_100am_20170618_1100pm_returnWeekendRate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy h:mm a"
        let entryDate = formatter.date(from: "17/06/2017 1:00 AM")
        let exitDate = formatter.date(from: "18/06/2017 11:00 PM")
        let rate = rateSelector.selectRate(enter: entryDate!, leave: exitDate!)
        XCTAssertEqual(rate.name, "Weekend Rate")
    }
    
    func testSelectRate_given20170617_100am_20170619_1200am_returnStandardRate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy h:mm a"
        let entryDate = formatter.date(from: "17/06/2017 1:00 AM")
        let exitDate = formatter.date(from: "19/06/2017 12:00 AM")
        let rate = rateSelector.selectRate(enter: entryDate!, leave: exitDate!)
        XCTAssertEqual(rate.name, "Standard Rate")
    }
}
