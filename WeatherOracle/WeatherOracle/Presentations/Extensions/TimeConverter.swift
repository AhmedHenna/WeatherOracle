//
//  TimeConverter.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/17/23.
//

import Foundation

class TimeConverter {
    func timeToMinutes(hours: Int, minutes: Int) -> Int {
        return hours * 60 + minutes
    }
    
    func minutesToTime(totalMinutes: Int) -> (hours: Int, minutes: Int) {
        let hours = totalMinutes / 60
        let minutes = totalMinutes % 60
        return (hours, minutes)
    }
}
