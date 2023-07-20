//
//  SunPathView.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/17/23.
//

import SwiftUI

struct SunriseSunsetView: View {
    @State var isSunrise : Bool
    @State var currentTime : String
    @State var sunTime : String
    
    var body: some View {
        ZStack{
            WidgetCardContainer(icon: isSunrise ? "sunrise" : "sunset",
                                title: isSunrise ? "SUNRISE" : "SUNSET",
                                width: 160, height: 160,
                                content: {
                content
            })
        }
    }
    
    var content : some View {
        VStack (alignment: .leading, spacing: 10){
            
            Text(currentTime)
                .font(.title)
            
            SunMovement(hour: 21   ,min: 0 ,
                        strokeColor: Color.linearBackgroundMorning, sunColor: Color.yellow)
            .padding(.horizontal, -15)
            
            HStack (spacing: 2){
                Text(isSunrise ? "Sunset:" : "Sunrise")
                Text(sunTime)
            }
            .font(.caption)
        }
        .foregroundColor(.white)
    }
}

struct SunriseSunsetView_Previews: PreviewProvider {
    static var previews: some View {
        SunriseSunsetView(isSunrise: true, currentTime: "2:27 AM", sunTime: "9:14")
    }
}
