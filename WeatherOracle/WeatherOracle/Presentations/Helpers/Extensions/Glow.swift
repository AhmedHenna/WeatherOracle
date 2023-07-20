//
//  Glow.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/20/23.
//

import SwiftUI

extension View {
    func glow(color: Color = .white, radius: CGFloat = 50) -> some View {
        self
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
    }
}
