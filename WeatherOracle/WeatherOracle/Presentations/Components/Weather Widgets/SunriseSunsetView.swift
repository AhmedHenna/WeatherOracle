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
            Color.linearBackgroundNight
            WidgetCardContainer(icon: isSunrise ? "sunrise" : "sunset",
                                title: isSunrise ? "SUNRISE" : "SUNSET",
                                content: {
                content
            })
        }
    }
    
    var content : some View {
        VStack (alignment: .leading, spacing: 10){
            
            Text(currentTime)
                .font(.title)
                .foregroundColor(.white)
            
            SunMovement(strokeColor: Color.linearBackgroundMorning, sunColor: Color.yellow)
                .overlay(content: {
                    Divider()
                        .frame(height: 0.5)
                        .background(Color("Text Secondary"))
                })
                .padding(.horizontal, -15)
            
            HStack (spacing: 2){
                Text(isSunrise ? "Sunset:" : "Sunrise")
                Text(sunTime)
            }
            .foregroundColor(Color(.white))
            .font(.caption)
            
        }
    }
}

struct SunriseSunsetView_Previews: PreviewProvider {
    static var previews: some View {
        SunriseSunsetView(isSunrise: true, currentTime: "2:27 AM", sunTime: "9:14")
    }
}
