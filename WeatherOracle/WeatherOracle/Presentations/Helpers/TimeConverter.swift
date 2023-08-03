//
//  TimeConverter.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/17/23.
//

import Foundation

class TimeConverter {
    func timeToMinutes(epoch: Int, offset: Int) -> Int {
        let currentTime = TimeConverter.convertEpochToTime(epoch: TimeInterval(epoch), withSeconds: true, timeZoneOffset: offset)
        
        let components = currentTime.split(separator: ":")
          guard components.count == 3,
                let hour = Int(components[0]),
                let minute = Int(components[1]) else {
              return 0
          }

        return hour * 60 + minute
    }
    
    static func convertEpochToDate(epoch: TimeInterval, timeZoneOffset: Int) -> Date {
        return Date(timeIntervalSince1970: epoch + TimeInterval(timeZoneOffset))
    }
    
    static func convertEpochToTime(epoch: TimeInterval, withSeconds: Bool, timeZoneOffset: Int, is12HourFormat: Bool = false) -> String {
        let date = Date(timeIntervalSince1970: epoch)
        
        let dateFormatter = DateFormatter()
        if withSeconds {
            dateFormatter.dateFormat = is12HourFormat ? "h:mm:ss a" : "HH:mm:ss"
        } else {
            dateFormatter.dateFormat = is12HourFormat ? "h:mm a" : "HH:mm"
        }
        dateFormatter.timeZone = TimeZone(secondsFromGMT: timeZoneOffset)
        
        return dateFormatter.string(from: date)
    }

    
    static func getTimeOfDay(currentTime: Int, sunset: Int, sunrise: Int, offset: Int) -> String {
        let currentTime = TimeConverter.convertEpochToTime(epoch: TimeInterval(currentTime), withSeconds: true, timeZoneOffset: offset)
        
        let sunset = TimeConverter.convertEpochToTime(epoch: TimeInterval(sunset), withSeconds: true, timeZoneOffset: offset)
        let sunrise = TimeConverter.convertEpochToTime(epoch: TimeInterval(sunrise), withSeconds: true, timeZoneOffset: offset)
        let afternoon = "12:00:00"
        
        
        
        if currentTime < afternoon && currentTime > sunrise{
            return "Morning"
            
        }else if currentTime > afternoon && currentTime < sunset{
            return "Afternoon"
            
        }else {
            return "Night"
        }
    }
    
    
}
