//
//  Mountain.swift
//  MorningNight
//
//  Created by Franco Fantillo on 2023-09-29.
//

import SwiftUI

struct Mountain: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        
        
        let startHeight = rect.midY - rect.midY/3
        
        let point1 = CGPoint(x:(rect.midX/3) * 2.5, y: rect.midY - rect.midY/3)
        let control1 = CGPoint(x:(rect.midX/3) * 1.25, y: rect.midY - rect.midY/1.5)
        
        let centerPoint = CGPoint(x: rect.midX, y: rect.midY)
        
        let point2 = CGPoint(x: rect.maxX, y: rect.midY)
        let control2 = CGPoint(x: rect.midX * 1.15, y: rect.maxY/1.3)
        
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        
        path.addLine(to: CGPoint(x: 0, y: startHeight))

        path.addQuadCurve(to: point1, control: control1)
        
        path.addQuadCurve(to: centerPoint, control: CGPoint(x: centerPoint.x - centerPoint.x/15, y: centerPoint.y - centerPoint.y/4))
        
        path.addQuadCurve(to: point2, control: control2)
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))

        path.closeSubpath()
        return path
    }
}
