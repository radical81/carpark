//
//  RateSelector.swift
//  CarPark
//
//  Created by Rex Jason Alobba on 15/6/17.
//  Copyright © 2017 Rex Jason Alobba. All rights reserved.
//

import Foundation

class RateSelector {
    fileprivate var rates: Array<Rate>
    fileprivate var defaultRate: NSDictionary
    
    init() {
        self.rates = []
        self.defaultRate = [:]
        var myDict: NSDictionary!
        if let path = Bundle.main.path(forResource: "Rates", ofType: "plist") {
            myDict = NSDictionary(contentsOfFile: path)
            if(myDict.object(forKey: "rates") != nil) {
                let rateList = myDict.object(forKey: "rates") as! NSArray
                for r in rateList {
                    self.rates.append(Rate(data: r as! NSDictionary))
                    if (r as AnyObject).object(forKey: "type_code") as! String == "hourly" {
                        self.defaultRate = r as! NSDictionary
                    }
                }
            }
        }
        NSLog("%@",self.rates)
    }

    func getRates() -> Array<Rate> {
        return self.rates
    }
    
    func setRates(rates: Array<Rate>) {
        self.rates = rates
    }
    
    func getDefaultRate() -> NSDictionary {
        return self.defaultRate
    }
    
    func setDefaultRate(rate: NSDictionary) {
        self.defaultRate = rate
    }
    
    func selectRate(enter: Date, leave: Date) ->Rate {
        
        let timeHelper = TimeCheckHelper()
        
        for r in self.rates {
            
            if r.typeCode == "hourly" {
                continue //Skip for now and check other rates first
            }
            
            let entryStart = r.entry["start"] as! String
            
            let entryEnd = r.entry["end"] as! String
            
            let entryDays = r.entry["days"] as! NSArray
            
            let exitStart = r.exit["start"] as! String
            
            let exitEnd = r.exit["end"] as! String
            
            let exitDays = r.exit["days"] as! NSArray
            
            let maxDays = r.maxDays

            let daysBetween = timeHelper.numberOfDaysInBetween(enter: enter, leave: leave)
            
            if timeHelper.isInTime(date: enter, start: entryStart, end: entryEnd)
                && timeHelper.isDateInDayRange(date: enter, days: entryDays)
                && timeHelper.isInTime(date: leave, start: exitStart, end: exitEnd)
                && timeHelper.isDateInDayRange(date: leave, days: exitDays)
                && Int(daysBetween) <= Int(maxDays)  {
                return r
            }
        }
        
        return Rate(data: self.defaultRate)
    }
}
