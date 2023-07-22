//
//  WeatherOracleApp.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/2/23.
//

import SwiftUI
import Firebase

@main
struct WeatherOracleApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
