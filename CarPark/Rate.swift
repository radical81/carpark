//
//  Rate.swift
//  CarPark
//
//  Created by Rex Jason Alobba on 15/6/17.
//  Copyright © 2017 Rex Jason Alobba. All rights reserved.
//

import Foundation

class Rate {

    fileprivate var _name: String
    fileprivate var _typeText: String
    fileprivate var _typeCode: String
    fileprivate var _flatPrice: NSNumber
    fileprivate var _hourlyPrices: Array<[String: NSNumber]>
    fileprivate var _entry: [String: AnyObject]
    fileprivate var _exit: [String: AnyObject]
    fileprivate var _maxDays: NSNumber
    
    var name: String {
        return _name
    }
    
    var typeText: String {
        return _typeText
    }
    
    var typeCode: String {
        return _typeCode
    }
    
    var flatPrice: NSNumber {
        return _flatPrice
    }
    
    var hourlyPrices: Array<[String: NSNumber]> {
        return _hourlyPrices
    }
    
    var entry: [String: AnyObject] {
        return _entry
    }
    
    var exit: [String: AnyObject] {
        return _exit
    }
    
    var maxDays: NSNumber {
        return _maxDays
    }
    
    init(data: NSDictionary) {
        if let name = data["name"] as? String {
            self._name = name
        }
        else {
            self._name = ""
        }
        
        if let typeText = data["type"] as? String {
            self._typeText = typeText
        }
        else {
            self._typeText = ""
        }
        
        if let typeCode = data["type_code"] as? String {
            self._typeCode = typeCode
        }
        else {
            self._typeCode = ""
        }
        
        if let flatPrice = data["price"] as? NSNumber {
            self._flatPrice = flatPrice
        }
        else {
            self._flatPrice = 0
        }
        
        if let hourlyPrices = data["prices"] as? Array<[String: NSNumber]> {
            self._hourlyPrices = hourlyPrices
        }
        else {
            self._hourlyPrices = []
        }
        
        if let entry = data["entry"] as? [String: AnyObject],
           let start = entry["start"],
           let end = entry["end"],
           let days = entry["days"] {
           self._entry = ["start": start, "end": end, "days": days]
        }
        else {
            self._entry = ["start": "" as AnyObject, "end": "" as AnyObject, "days": AnyObject.self as AnyObject]
        }

        if let exit = data["exit"] as? [String: AnyObject],
            let start = exit["start"],
            let end = exit["end"],
            let days = exit["days"] {
            self._exit = ["start": start, "end": end, "days": days]
        }
        else {
            self._exit = ["start": "" as AnyObject, "end": "" as AnyObject, "days": AnyObject.self as AnyObject]
        }
        
        if let maxDays = data["max_days"] as? NSNumber {
            self._maxDays = maxDays
        }
        else {
            self._maxDays = -1
        }
    }
}
