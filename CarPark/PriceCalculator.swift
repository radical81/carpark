//
//  PriceCalculator.swift
//  CarPark
//
//  Created by Rex Jason Alobba on 17/6/17.
//  Copyright © 2017 Rex Jason Alobba. All rights reserved.
//

import Foundation

class PriceCalculator {
    
    func calculatePrice(enter: Date, leave: Date, rate: Rate) -> NSNumber {
        if rate.typeCode == "hourly" {
            let t = TimeCheckHelper()
            let hoursBetween = t.numberOfHoursInBetween(enter: enter, leave: leave) as! Int
            if !rate.hourlyPrices.isEmpty {
                for r in rate.hourlyPrices {
                    if hoursBetween >= r["min"] as! Int {
                        if hoursBetween <= r["max"] as! Int && r["max"] != -1 {
                            let price = r["price"]
                            return price!
                        }
                        if r["max"] == -1 {
                            let calendar = NSCalendar.current
                            
                            // Replace the hour (time) of both dates with 00:00
                            let date1 = calendar.startOfDay(for: enter)
                            let date2 = calendar.startOfDay(for: leave)
                            
                            let components = calendar.dateComponents([.day], from: date1, to: date2)
                            let calendarDays = Double(components.day! + 1)

                            let price = Double(r["price"]!)
                            let totalPrice = calendarDays * price
                            return totalPrice as NSNumber
                        }
                    }
                }
            }
        }
        return rate.flatPrice
    }
}
