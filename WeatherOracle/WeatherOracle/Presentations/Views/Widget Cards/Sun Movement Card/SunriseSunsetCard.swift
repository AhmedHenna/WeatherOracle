//
//  SunPathView.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/17/23.
//

import SwiftUI

struct SunriseSunsetCard: View {
    @State var isSunrise : Bool
    @State var sunRise: Int
    @State var sunSet: Int
    @State var currentTime: Int
    
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
            let sunrise = TimeConverter.convertEpochToTime(epoch: TimeInterval(sunRise), withSeconds: false)
            
            let sunset = TimeConverter.convertEpochToTime(epoch: TimeInterval(sunSet), withSeconds: false)
        
            
            Text(isSunrise ? "\(sunrise)" : "\(sunset)")
                .font(.title)
            
            SunMovement(time: currentTime,
                        strokeColor: Color.linearBackgroundMorning, sunColor: Color.yellow)
            .padding(.horizontal, -15)
            
            HStack (spacing: 2){
                Text(isSunrise ? "Sunset:" : "Sunrise:")
                Text(isSunrise ? "\(sunset)" : "\(sunrise)")
                Text(isSunrise ? "pm" : "am")
            }
            .font(.caption)
        }
        .foregroundColor(.white)
    }
}

struct SunriseSunsetView_Previews: PreviewProvider {
    static var previews: some View {
        SunriseSunsetCard(isSunrise: true, sunRise: 1690950305, sunSet: 1691005706, currentTime: 1690983651)
            .preferredColorScheme(.dark)
    }
}
