//
//  TimeCheckHelper.swift
//  CarPark
//
//  Created by Rex Jason Alobba on 16/6/17.
//  Copyright © 2017 Rex Jason Alobba. All rights reserved.
//

import Foundation

class TimeCheckHelper {

    func isInTime(date: Date, start: String, end: String) -> Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        
        print("time = \(hour):\(minutes)")
        
        if !start.isEmpty {
            let startDate = formatter.date(from: start)
            if startDate == nil {
                return false
            }
            let startHour = calendar.component(.hour, from: startDate!)
            let startMinute = calendar.component(.minute, from: startDate!)

            if hour < startHour {
                return false
            }
            else {
                if minutes < startMinute {
                    return false
                }
            }
        }
        
        if !end.isEmpty {
            let endDate = formatter.date(from: end)
            if endDate == nil {
                return false
            }
            let endHour = calendar.component(.hour, from: endDate!)
            let endMinute = calendar.component(.minute, from: endDate!)

            if hour > endHour {
                if(endHour == 0) { //12:00 AM
                    return true
                }
                return false
            }
            else {
                if minutes > endMinute {
                    return false
                }
            }
        }
        
        
        return true
    }
    
    func isDateInDayRange(date: Date, days: NSArray) -> Bool {
        let calendar = Calendar.current
        let weekDay = calendar.component(.weekday, from: date) - 1
        
        if days.count == 0 {
            return true
        }
        
        for d in days {
            if((d as! String).caseInsensitiveCompare(calendar.weekdaySymbols[weekDay]) == ComparisonResult.orderedSame) {
                return true
            }
        }
        return false
    }
    
    func numberOfDaysInBetween(enter:Date, leave: Date) -> NSNumber {
        let calendar = NSCalendar.current
        
        // Replace the hour (time) of both dates with 00:00
        let date1 = calendar.startOfDay(for: enter)
        let date2 = calendar.startOfDay(for: leave)
        
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        return components.day! as NSNumber
    }
}
