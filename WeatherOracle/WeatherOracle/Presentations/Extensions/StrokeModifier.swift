//
//  StrokeModifier.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/17/23.
//

import SwiftUI

struct StrokeModifier: ViewModifier{
    var cornerRadius: CGFloat
    @Environment(\.colorScheme) var colorScheme
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .stroke(
                    .linearGradient(
                        colors: [
                            .white.opacity(colorScheme == .dark ? 0.3 : 0.4),
                            .black.opacity(colorScheme == .dark ? 0.3 : 0.1)
                        ],startPoint: .top, endPoint: .bottom
                    )
                )
                .blendMode(.overlay)
        )
    }
}


extension View{
    func strokeStyle(cornerRadius: CGFloat = 30) -> some View{
        modifier(StrokeModifier(cornerRadius: cornerRadius))
    }
}
