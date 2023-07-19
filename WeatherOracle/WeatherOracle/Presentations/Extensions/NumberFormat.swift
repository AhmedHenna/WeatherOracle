//
//  NumberFormat.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/19/23.
//

import Foundation

func formatNumber(_ number: Double) -> String {
       let formatter = NumberFormatter()
       formatter.minimumFractionDigits = 0
       formatter.maximumFractionDigits = 16 // Adjust this value based on your precision needs
       
       return String(formatter.string(from: NSNumber(value: number)) ?? "")
   }
