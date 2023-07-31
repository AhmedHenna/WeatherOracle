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
    
    static func convertEpochToDate(epoch: TimeInterval) -> Date {
        return Date(timeIntervalSince1970: epoch)
    }
    
    
    static func getTimeOfDay(currentTime: Int, sunset: Int) -> String {
        let currentTime = TimeConverter.convertEpochToTime(epoch: TimeInterval(currentTime))
        let sunset = TimeConverter.convertEpochToTime(epoch: TimeInterval(sunset))
        let afternoon = "12:00:00"
        
        if currentTime < afternoon{
            return "Morning"
            
        }else if currentTime > afternoon && currentTime < sunset{
            return "Afternoon"
            
        }else if currentTime > sunset{
            return "Night"
        }
        
        return "Morning"
    }
    
    static func convertEpochToTime(epoch: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: epoch)
        let calendar = Calendar.current
        let timeComponents = calendar.dateComponents([.hour, .minute, .second], from: date)
        
        guard let hour = timeComponents.hour,
              let minute = timeComponents.minute,
              let second = timeComponents.second else {
            return "Invalid epoch"
        }
        
        let formattedTime = String(format: "%02d:%02d:%02d", hour, minute, second)
        
        return formattedTime
    }
}
