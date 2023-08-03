//
//  WidgetHelper.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 8/3/23.
//

import Foundation

func getUVIValues(hourly: [HourlyForecast]) -> (Int?, Int?){
    var start: Int? = nil
    var end: Int? = nil
        
    for item in hourly.prefix(24){
        if item.uvi ?? 10 > 2{
            if start == nil{
                start = item.dt
            }
            end = item.dt
        }
    }
    
    return (start, end)
}
