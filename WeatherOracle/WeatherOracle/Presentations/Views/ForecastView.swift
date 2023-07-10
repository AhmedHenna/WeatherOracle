//
//  ForecastView.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/10/23.
//

import SwiftUI

struct ForecastView: View {
    var bottomSheetTranslationProrated: CGFloat = 1
    @State private var selection = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Tabs(selection: $selection)
                forecastCards
            }
        }
        .background(Color.linearBackgroundMorning)
        .clipShape(RoundedRectangle(cornerRadius: 44))
        .overlay {
            bottomSheetSeperator
        }
        .overlay {
            dragIndicator
        }
    }
    
    var forecastCards : some View{
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                if selection == 0 {
                    ForEach(Forecast.hourly) { forecast in
                        ForecastCard(forecast: forecast, forecastPeriod: .hourly)
                    }
                    .transition(.offset(x: -430))
                } else {
                    ForEach(Forecast.daily) { forecast in
                        ForecastCard(forecast: forecast, forecastPeriod: .daily)
                    }
                    .transition(.offset(x: 430))
                }
            }
            .padding(.vertical, 20)
        }
        .padding(.horizontal, 20)
    }
    
    var bottomSheetSeperator : some View{
        Divider()
            .blendMode(.overlay)
            .background(Color.linearHighlight)
            .frame(maxHeight: .infinity, alignment: .top)
            .clipShape(RoundedRectangle(cornerRadius: 44))
    }
    
    var dragIndicator : some View{
        RoundedRectangle(cornerRadius: 10)
            .fill(.black.opacity(0.3))
            .frame(width: 48, height: 5)
            .frame(height: 20)
            .frame(maxHeight: .infinity, alignment: .top)
    }
}

import SwiftUI

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView()
            .preferredColorScheme(.dark)
    }
}

