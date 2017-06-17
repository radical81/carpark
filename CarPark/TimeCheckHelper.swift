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
    
    
    
    
}
