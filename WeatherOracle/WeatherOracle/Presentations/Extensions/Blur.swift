//
//  Blur.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/12/23.
//

import SwiftUI

struct Blur: View {
    var radius: CGFloat = 3
    var opaque: Bool = false
    
    var body: some View {
        Backdrop()
            .blur(radius: radius, opaque: opaque)
    }
}

struct Backdrop: UIViewRepresentable {
    func makeUIView(context: Context) -> UIBackdropView {
        UIBackdropView()
    }
    
    func updateUIView(_ uiView: UIBackdropView, context: Context) {}
}

class UIBackdropView: UIView {
    override class var layerClass: AnyClass {
        NSClassFromString("CABackdropLayer") ?? CALayer.self
    }
}


extension View {
    func backgroundBlur(radius: CGFloat = 3, opaque: Bool = false) -> some View {
        self
            .background(
                Blur(radius: radius, opaque: opaque)
            )
    }
}


