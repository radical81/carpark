//
//  TimeCheckHelperTests.swift
//  CarPark
//
//  Created by Rex Jason Alobba on 16/6/17.
//  Copyright © 2017 Rex Jason Alobba. All rights reserved.
//

import XCTest
@testable import CarPark

class TimeCheckHelperTests: XCTestCase {
    let timeCheckHelper = TimeCheckHelper()
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIsInTime_given20170601_700am_start600am_end900am_returnTrue() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy h:mm a"
        let entry = formatter.date(from: "01/06/2017 7:00 AM")
        XCTAssertTrue(timeCheckHelper.isInTime(date: entry!, start: "6:00 AM", end: "9:00 AM"))
    }
    
    func testIsInTime_given20170601_901am_start600am_end900am_returnTrue() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy h:mm a"
        let entry = formatter.date(from: "01/06/2017 9:01 AM")
        XCTAssertFalse(timeCheckHelper.isInTime(date: entry!, start: "6:00 AM", end: "9:00 AM"))
    }
    
    func testIsInTime_given20170601_700am_start600am_endNull_returnTrue() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy h:mm a"
        let entry = formatter.date(from: "01/06/2017 7:00 AM")
        XCTAssertTrue(timeCheckHelper.isInTime(date: entry!, start: "6:00 AM", end: ""))
    }
    
    func testIsInTime_given20170601_700am_startNull_end900am_returnTrue() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy h:mm a"
        let entry = formatter.date(from: "01/06/2017 7:00 AM")
        XCTAssertTrue(timeCheckHelper.isInTime(date: entry!, start: "", end: "9:00 AM"))
    }
    
    func testIsInTime_given20170601_700am_startNull_endNull_returnTrue() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy h:mm a"
        let entry = formatter.date(from: "01/06/2017 7:00 AM")
        XCTAssertTrue(timeCheckHelper.isInTime(date: entry!, start: "", end: ""))
    }
    
    func testIsInTime_given20170601_700pm_start600pm_end1200am_returnTrue() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy h:mm a"
        let entry = formatter.date(from: "01/06/2017 7:00 PM")
        XCTAssertTrue(timeCheckHelper.isInTime(date: entry!, start: "6:00 PM", end: "12:00 AM"))
    }
}
