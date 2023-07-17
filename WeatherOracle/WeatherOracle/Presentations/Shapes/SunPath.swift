//
//  SunPath.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/17/23.
//

import SwiftUI


struct SunPath: Shape {
    func path(in rect: CGRect) -> Path {
        let rect = rect
        let arrow: CGSize = CGSize(width: (CGFloat(164)), height: CGFloat(40))
        let apex = CGPoint(x: arrow.width*0.5*0.000, y: -arrow.height*0.1456)
        let peak = CGPoint(x: arrow.width*0.8*0.15, y: arrow.height*0.1864)
        let curv = CGPoint(x: arrow.width*0.5*0.600, y: arrow.height*0.7500)
        let ctrl = CGPoint(x: arrow.width*0.5*0.750, y: arrow.height*1.0000)
        let base = CGPoint(x: arrow.width*0.5*1.000, y: arrow.height*1.1)
        
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX - base.x, y: base.y))
        
        path.addLine(to: CGPoint(x: rect.midX - base.x, y: base.y))

        path.addQuadCurve(to: CGPoint(x: rect.midX - curv.x, y: curv.y),
                          control: CGPoint(x: rect.midX - ctrl.x, y: ctrl.y))

        path.addLine(to: CGPoint(x: rect.midX - peak.x, y: peak.y))

        path.addQuadCurve(to: CGPoint(x: rect.midX + peak.x, y: peak.y),
                          control: CGPoint(x: rect.midX + apex.x, y: apex.y))

        path.addLine(to:CGPoint(x: rect.midX + curv.x, y: curv.y))

        path.addQuadCurve(to: CGPoint(x: rect.midX + base.x, y: base.y),
                          control: CGPoint(x: rect.midX + ctrl.x, y: ctrl.y))

        return path
        }
}

struct SunPathView: View {
    var body: some View {
        SunPath()
            .stroke(Color.white, lineWidth: 2)
            .frame(width: 164, height: 164)
    }
}

struct SunPath_Previews: PreviewProvider {
    static var previews: some View {
        SunPathView()
    }
}

