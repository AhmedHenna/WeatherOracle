//
//  Extensions.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/7/23.
//

import SwiftUI

extension Color {
    static let linearHighlight = LinearGradient(gradient: Gradient(colors: [.white.opacity(0), .white, .white.opacity(0)]), startPoint: .leading, endPoint: .trailing)
    static let linearBackground = LinearGradient(gradient: Gradient(colors: [Color(red: 30/255.0, green: 147/255.0, blue: 163/255.0), Color(red: 9/255.0, green: 57/255.0, blue: 64/255.0)]), startPoint: .top, endPoint: .bottom)
    static let linearWidgetBackground = LinearGradient(gradient: Gradient(colors: [Color(red: 30/255.0, green: 176/255.0, blue: 141/255.0), Color(red: 162/255.0, green: 151/255.0, blue: 238/255.0)]), startPoint: .leading, endPoint: .trailing)
    static let linearBackgroundMorning = LinearGradient(gradient: Gradient(colors: [Color(red: 0/255.0, green: 175/255.0, blue: 214/255.0),Color(red: 0/255.0, green: 175/255.0, blue: 214/255.0), Color(red: 0/255.0, green: 69/255.0, blue: 84/255.0)]), startPoint: .top, endPoint: .bottom)
    static let linearBackgroundNight = LinearGradient(gradient: Gradient(colors: [Color(red: 0/255.0, green: 79/255.0, blue: 97/255.0), Color(red:0/255.0, green: 58/255.0, blue: 70/255.0), Color(red: 0/255.0, green: 0/255.0, blue: 0/255.0)]), startPoint: .top, endPoint: .bottom)
    static let linearBackgroundAfternoon = LinearGradient(gradient: Gradient(colors: [Color(red: 251/255.0, green: 211/255.0, blue: 3/255.0), Color(red: 255/255.0, green: 156/255.0, blue: 9/255.0), Color(red: 200/255.0, green: 122/255.0, blue: 7/255.0)]), startPoint: .top, endPoint: .bottom)
}
