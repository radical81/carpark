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
    
    
    func testIsDateInDayRange_given20170601_700pm_daysThursdayFriday_returnTrue() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy h:mm a"
        let testDate = formatter.date(from: "01/06/2017 7:00 PM")
        XCTAssertTrue(timeCheckHelper.isDateInDayRange(date: testDate!, days: ["THURSDAY", "FRIDAY"]))
    }
    
    func testIsDateInDayRange_given20170601_700pm_daysSunday_returnFalse() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy h:mm a"
        let testDate = formatter.date(from: "01/06/2017 7:00 PM")
        XCTAssertFalse(timeCheckHelper.isDateInDayRange(date: testDate!, days: ["SUNDAY"]))
    }
    
    func testIsDateInDayRange_given20170601_700pm_daysNone_returnTrue() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy h:mm a"
        let testDate = formatter.date(from: "01/06/2017 7:00 PM")
        XCTAssertTrue(timeCheckHelper.isDateInDayRange(date: testDate!, days: []))
    }

    func testNumberOfDaysInBetween_given20170601_700am_to_20170601_600pm_return0() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy h:mm a"
        let entry = formatter.date(from: "01/06/2017 7:00 AM")
        let exit = formatter.date(from: "01/06/2017 6:00 PM")
        XCTAssertEqual(timeCheckHelper.numberOfDaysInBetween(enter: entry!, leave: exit!), 0)
    }
    
    func testNumberOfDaysInBetween_given20170601_700pm_to_20170602_600am_return1() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy h:mm a"
        let entry = formatter.date(from: "01/06/2017 7:00 PM")
        let exit = formatter.date(from: "02/06/2017 6:00 AM")
        XCTAssertEqual(timeCheckHelper.numberOfDaysInBetween(enter: entry!, leave: exit!), 1)
    }
    
    func testNumberOfDaysInBetween_given20170617_1200am_to_20170618_1100pm_return1() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy h:mm a"
        let entry = formatter.date(from: "17/06/2017 12:00 AM")
        let exit = formatter.date(from: "18/06/2017 11:00 PM")
        XCTAssertEqual(timeCheckHelper.numberOfDaysInBetween(enter: entry!, leave: exit!), 1)
    }
    
    func testNumberOfHoursInBetween_given20170617_100am_20170619_1200am_return47() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy h:mm a"
        let entryDate = formatter.date(from: "17/06/2017 1:00 AM")
        let exitDate = formatter.date(from: "19/06/2017 12:00 AM")
        XCTAssertEqual(timeCheckHelper.numberOfHoursInBetween(enter: entryDate!, leave: exitDate!), 47)
    }
    
    func testNumberOfHoursInBetween_given20170617_100am_20170617_600am_return5() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy h:mm a"
        let entryDate = formatter.date(from: "17/06/2017 1:00 AM")
        let exitDate = formatter.date(from: "17/06/2017 6:00 AM")
        XCTAssertEqual(timeCheckHelper.numberOfHoursInBetween(enter: entryDate!, leave: exitDate!), 5)
    }
}
