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

func uviText(uviValue: Int) -> String{
    if (0...2).contains(uviValue){
        return "LOW"
    }
    if (3...5).contains(uviValue){
        return "MODERATE"
    }
    if (6...7).contains(uviValue){
        return "HIGH"
    }
    if (8...10).contains(uviValue){
        return "VERY HIGH"
    }
    if uviValue > 10{
        return "EXTREME"
    }
    
    return "LOW"
}

