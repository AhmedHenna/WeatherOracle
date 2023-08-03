//
//  ForecastCard.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/10/23.
//

import SwiftUI

struct ForecastCard: View {
    var dayTime: Int
    var sunset: Int
    var sunrise: Int
    var offset: Int
    var forecast: WeatherForcast
    var forecastPeriod: ForecastPeriod
    var firstEntry: Date
    var isActive: Bool {
        if forecastPeriod == ForecastPeriod.hourly {
            let isThisHour = Calendar.current.isDate(forecast.date, equalTo: firstEntry , toGranularity: .hour)
            return isThisHour
        } else {
            let isToday = Calendar.current.isDate(forecast.date, equalTo: firstEntry, toGranularity: .day)
            return isToday
        }
    }
    
    var body: some View {
        ZStack {
            cardShape
            cardDetails
        }
    }
    
    var cardShape : some View{
        RoundedRectangle(cornerRadius: 30)
            .fill(isActive ? Color("Accent") : Color("Primary"))
            .frame(width: 60, height: 163)
            .shadow(color: .black.opacity(0.25), radius: 10, x: 5, y: 4)
            .overlay {
                RoundedRectangle(cornerRadius: 30)
                    .strokeBorder(.white.opacity(isActive ? 0.5 : 0.2))
                    .blendMode(.overlay)
            }
            .innerShadow(shape: RoundedRectangle(cornerRadius: 30),
                         color: .white.opacity(0.25),
                         lineWidth: 1, offsetX: 1,
                         offsetY: 1, blur: 0,
                         blendMode: .overlay)
    }
    
    var cardDetails : some View{
        VStack(spacing: 16) {
            Text(formatDate(forecast.date, forecastPeriod: forecastPeriod))
                        .font(.subheadline.weight(.semibold))
                        .frame(width: 60)
            
            VStack(spacing: -20) {
                Image(mapToIcon(id: forecast.weatherID, time: TimeConverter.getTimeOfDay(currentTime: dayTime, sunset: sunset, sunrise: sunrise, offset: offset)))
                    .resizable().frame(width: 80, height: 80)
                
                Text(forecast.rainPercentage, format: .percent)
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(Color("Text Highlights"))
                    .opacity(forecast.rainPercentage > 0 ? 1 : 0)
                    .offset(x: 3)
            }
            .frame(height: 40)
            .offset(y:-10)
            
            Text("\(forecast.temperature)°")
                .font(.title3)
                .offset(x:3)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 16)
        .frame(width: 60, height: 146)
    }
}

struct ForecastCard_Previews: PreviewProvider {
    static var previews: some View {
        ForecastCard(
            dayTime: 1,
            sunset: 1,
            sunrise: 1,
            offset: 1,
            forecast: WeatherForcast(date: TimeConverter.convertEpochToDate(
                epoch: TimeInterval(1690394400), timeZoneOffset: 0),
                                     temperature: 27,
                                     rainPercentage: 0.1,
                                     weatherID: 800),
            forecastPeriod: .daily,
            firstEntry: Date()
        )
        .preferredColorScheme(.dark)
    }
}

private func formatDate(_ date: Date, forecastPeriod: ForecastPeriod) -> String {
    let dateFormatter = DateFormatter()
    if forecastPeriod == .hourly {
        dateFormatter.dateFormat = "h a"
    } else {
        dateFormatter.dateFormat = "EEE"
    }
    dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
    return dateFormatter.string(from: date)
}
