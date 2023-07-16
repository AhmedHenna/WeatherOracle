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
        VStack (alignment: .leading, spacing: 3){
            Spacer()
            Text(currentTime)
                .font(.title)
                .foregroundColor(.white)
            
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
