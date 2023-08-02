//
//  TimeConverter.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/17/23.
//

import Foundation

class TimeConverter {
    func timeToMinutes(epoch: Int) -> Int {
        let currentTime = TimeConverter.convertEpochToTime(epoch: TimeInterval(epoch), withSeconds: true)
        
        let components = currentTime.split(separator: ":")
          guard components.count == 3,
                let hour = Int(components[0]),
                let minute = Int(components[1]) else {
              return 0
          }

        return hour * 60 + minute
    }
    
    static func convertEpochToDate(epoch: TimeInterval) -> Date {
        return Date(timeIntervalSince1970: epoch)
    }
    
    
    static func getTimeOfDay(currentTime: Int, sunset: Int, sunrise: Int) -> String {
        let currentTime = TimeConverter.convertEpochToTime(epoch: TimeInterval(currentTime), withSeconds: true)
        
        let sunset = TimeConverter.convertEpochToTime(epoch: TimeInterval(sunset), withSeconds: true)
        let sunrise = TimeConverter.convertEpochToTime(epoch: TimeInterval(sunrise), withSeconds: true)
        let afternoon = "12:00:00"
        
        
        
        if currentTime < afternoon && currentTime > sunrise{
            return "Morning"
            
        }else if currentTime > afternoon && currentTime < sunset{
            return "Afternoon"
            
        }else {
            return "Night"
        }
    }
    
    static func convertEpochToTime(epoch: TimeInterval, withSeconds: Bool) -> String {
        let date = Date(timeIntervalSince1970: epoch)
        let calendar = Calendar.current
        let timeComponents = calendar.dateComponents([.hour, .minute, .second], from: date)
        
        guard var hour = timeComponents.hour,
              let minute = timeComponents.minute,
              let second = timeComponents.second else {
            return "Invalid epoch"
        }
        
        if withSeconds {
            let formattedTime = String(format: "%2d:%02d:%02d", hour, minute, second)
            return formattedTime
        }else{
            
            if hour >= 12{
                hour = hour - 12
            }
            
            let formattedTime = String(format: "%2d:%02d", hour, minute)
            return formattedTime
        }
    }
}
