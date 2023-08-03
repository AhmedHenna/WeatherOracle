//
//  NumberFormat.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/19/23.
//

import Foundation

func formatNumber(_ number: Double) -> String {
    let formatter = NumberFormatter()
    formatter.minimumFractionDigits = 1
    formatter.maximumFractionDigits = 2 // Adjust this value based on your precision needs
    
    return String(formatter.string(from: NSNumber(value: number)) ?? "")
}

// MARK: - UV INDEX

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

// MARK: - AIR QUALITY

func airQualityTitle(aqiValue: Int) -> String{
    if (0...50).contains(aqiValue){
        return "GOOD"
    }
    if (51...100).contains(aqiValue){
        return "MODERATE"
    }
    if (101...150).contains(aqiValue){
        return "UNHEALTHY FOR SENSITE GROUPS"
    }
    if (151...200).contains(aqiValue){
        return "UNHEALTHY"
    }
    if (201...300).contains(aqiValue){
        return "VERY UNHEALTHY"
    }
    if (301...500).contains(aqiValue){
        return "HAZARDOUS"
    }
    
    return "GOOD"
}

func airQualityDescription(aqiValue: Int) -> String{
    if (0...50).contains(aqiValue){
        return "Air quality is considered satisfactory, and air pollution poses little to no risk."
    }
    if (51...100).contains(aqiValue){
        return "Air quality is acceptable, but there may be a moderate health concern for a small number of individuals"
    }
    if (101...150).contains(aqiValue){
        return "Members of sensitive groups, and individuals with respiratory or cardiovascular conditions, may experience health effects."
    }
    if (151...200).contains(aqiValue){
        return "Some members of the general public may experience health effects. Sensitive groups are more likely to be significantly affected."
    }
    if (201...300).contains(aqiValue){
        return "Health warnings are issued, as the entire population may experience more serious health effects."
    }
    if (301...500).contains(aqiValue){
        return "Health emergencies are declared. Seek immediate actions to minimize exposure and protect your health are necessary."
    }
    
    return "GOOD"
}

func getVisibilityDescription(visibility: Int) -> String {
    switch visibility {
    case 0..<1000:
        return "Visibility is very poor. Please exercise caution."
    case 1000..<5000:
        return "Visibility is poor. Drive carefully and stay safe. "
    case 5000..<8000:
        return "Visibility is moderate. Be aware of your surroundings."
    case 8000...10000:
        return "It's perfectly clear right now"
    default:
        return "Unknown Visibility"
    }
}
