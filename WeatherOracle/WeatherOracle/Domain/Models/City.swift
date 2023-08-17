//
//  City.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/22/23.
//

import SwiftUI

struct City: Hashable, Decodable {
    var country: String
    var city: String
    var lat: String
    var lng: String
}
