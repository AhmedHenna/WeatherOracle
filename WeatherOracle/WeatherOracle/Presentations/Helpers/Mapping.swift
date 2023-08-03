//
//  MapDescriptionToIcon.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/31/23.
//

import Foundation
import SwiftUI

func mapTimeToColor(time: Int, sunset: Int, sunrise: Int, offset: Int) -> LinearGradient{
    let time = TimeConverter.getTimeOfDay(currentTime: time, sunset: sunset, sunrise: sunrise, offset: offset)
    
    if time == "Morning"{
        return Color.linearBackgroundMorning
    }else if time == "Afternoon"{
        return Color.linearBackgroundAfternoon
    }else {
        return Color.linearBackgroundNight
    }
}

func mapTimeToImage(time: Int, sunset: Int, sunrise: Int, offset: Int) -> String{
    let time = TimeConverter.getTimeOfDay(currentTime: time, sunset: sunset, sunrise: sunrise, offset: offset)

    if time == "Morning"{
        return "Home Morning"
    }else if time == "Afternoon"{
        return "Home Afternoon"
    }else {
        return "Home Night"
    }
}


func mapToIcon(id: Int, time: String) -> String{
    
    if time == "Morning" || time == "Afternoon" {
        switch id{
            //Thunderstorm
        case 210, 211, 212, 221:
            return "Day Cloud With Lightning"
        case 200, 201, 202, 230, 231, 232:
            return "Day Windy Angled Rain Drops With Lightning"
            //Drizzle
        case 300, 301, 310:
            return "Rain Drops"
        case 302, 311, 312, 313, 314, 321:
            return "Windy Angled Rain Drops"
            //Rain
        case 500, 501:
            return "Day Partly Cloudy With Rain Drops"
        case 502, 503:
            return "Day Partly Cloudy With Rain"
        case 504:
            return "Day Partly Cloudy With Angled Rain"
        case 511:
            return "Day Snowing Cloud"
        case 520, 521:
            return "Day Rain Drops"
        case 522, 531:
            return "Day Angled Rainy"
            //Snow
        case 600, 601:
            return "Windy Snow"
        case 602, 611, 612, 613:
            return "Snow"
        case 615, 616, 620, 621, 622:
            return "Day Clouds With Snow"
            //Atmosphere
        case 701, 711, 721, 731, 741, 751, 761, 762, 771:
            return "Day Windy"
        case 781:
            return "Tornado"
            //Clear
        case 800:
            return "Sun"
            //Clouds
        case 801, 802:
            return "Day Partly Cloudy"
        case 803:
            return "Sunny Cloud"
        case 804:
            return "Cloudy Sunny Clouds"
            
        default:
            return "Sun"
        }
    } else {
        switch id{
            //Thunderstorm
        case 210, 211, 212, 221:
            return "Night Cloud With Lightning"
        case 200, 201, 202, 230, 231, 232:
            return "Night Windy Angled Rain Drops With Lightning"
            //Drizzle
        case 300, 301, 310:
            return "Rain Drops"
        case 302, 311, 312, 313, 314, 321:
            return "Windy Angled Rain Drops"
            //Rain
        case 500, 501:
            return "Night Partly Cloudy With Rain Drops"
        case 502, 503:
            return "Night Partly Cloudy With Rain"
        case 504:
            return "Night Partly Cloudy With Angled Rain"
        case 511:
            return "Night Snowing Cloud"
        case 520, 521:
            return "Night Rain Drops"
        case 522, 531:
            return "Night Angled Rainy"
            //Snow
        case 600, 601:
            return "Windy Snow"
        case 602, 611, 612, 613:
            return "Snow"
        case 615, 616, 620, 621, 622:
            return "Night Clouds With Snow"
            //Atmosphere
        case 701, 711, 721, 731, 741, 751, 761, 762, 771:
            return "Night Windy"
        case 781:
            return "Tornado"
            //Clear
        case 800:
            return "Moon"
            //Clouds
        case 801, 802:
            return "Night Partly Cloudy"
        case 803:
            return "Night Windy"
        case 804:
            return "Night Cloud"
        default:
            return "Moon"
        }
    }
}

