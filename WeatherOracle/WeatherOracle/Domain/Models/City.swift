//
//  City.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/22/23.
//

import SwiftUI

struct City: Identifiable {
    var id = UUID()
    var country: String
    var cityName: String
    var lat: Double
    var long: Double
}
