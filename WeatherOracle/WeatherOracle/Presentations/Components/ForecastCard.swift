//
//  ForecastCard.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/10/23.
//

import SwiftUI

struct ForecastCard: View {
    var forecast: Forecast
    var forecastPeriod: ForecastPeriod
    var isActive: Bool {
        if forecastPeriod == ForecastPeriod.hourly {
            let isThisHour = Calendar.current.isDate(.now, equalTo: forecast.date, toGranularity: .hour)
            return isThisHour
        } else {
            let isToday = Calendar.current.isDate(.now, equalTo: forecast.date, toGranularity: .day)
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
            Text(forecast.date, format: forecastPeriod == ForecastPeriod.hourly ? .dateTime.hour() : .dateTime.weekday())
                .font(.subheadline.weight(.semibold))
            
            VStack(spacing: -20) {
                Image(forecast.icon).resizable().frame(width: 80, height: 80)
                
                Text(forecast.probability, format: .percent)
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(Color("Text Highlights"))
                    .opacity(forecast.probability > 0 ? 1 : 0)
                    .offset(x: 3)
            }
            .frame(height: 40)
            .offset(y:-10)
            
            Text("\(forecast.temperature)°")
                .font(.title3)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 16)
        .frame(width: 60, height: 146)
    }
}

struct ForecastCard_Previews: PreviewProvider {
    static var previews: some View {
        ForecastCard(
            forecast: Forecast(
                date: Date(),
                weather: .sunny,
                probability: 60,
                temperature: 27,
                high: 30,
                low: 20,
                location: "Sample Location",
                icon: "Sun"
            ),
            forecastPeriod: .daily
        )
        .preferredColorScheme(.dark)
    }
}
