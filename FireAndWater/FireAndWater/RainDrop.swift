//
//  RainDrop.swift
//  FireAndWater
//
//  Created by Franco Fantillo on 2023-09-15.
//

import SwiftUI

struct RainDrop: Shape {
    func path(in rect: CGRect) -> Path {
        
        Path { path in
            path.move(to: CGPoint(x: rect.size.width/2, y: 0))
            path.addQuadCurve(to: CGPoint(x: rect.size.width/2, y: rect.size.height), control: CGPoint(x: rect.size.width, y: rect.size.height))
            path.addQuadCurve(to: CGPoint(x: rect.size.width/2, y: 0), control: CGPoint(x: 0, y: rect.size.height))
        }
    }
}
