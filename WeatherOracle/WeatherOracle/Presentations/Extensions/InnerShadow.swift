//
//  InnerShadow.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/10/23.
//

import SwiftUI

extension View {
    func innerShadow<shape: Shape, shapeStyle: ShapeStyle>(
        shape: shape,
        color: shapeStyle,
        lineWidth: CGFloat = 1,
        offsetX: CGFloat = 0,
        offsetY: CGFloat = 0,
        blur: CGFloat = 4,
        blendMode: BlendMode = .normal,
        opacity: Double = 1
    ) -> some View {
        self.overlay {
            shape
                .stroke(color, lineWidth: lineWidth)
                .blendMode(blendMode)
                .offset(x: offsetX, y: offsetY)
                .blur(radius: blur)
                .mask(shape)
                .opacity(opacity)
        }
    }
}
