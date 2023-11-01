//
//  Moon.swift
//  MorningNight
//
//  Created by Franco Fantillo on 2023-10-02.
//

import SwiftUI

struct MoonMask: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Rectangle().path(in: rect)
        path.addPath(Circle().path(in: rect.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 10))
            .offsetBy(dx: 50, dy: -10)))
        return path
    }
}

struct Moon: View {
    var body: some View {

        Circle()
            .mask(MoonMask().fill(style: FillStyle(eoFill: true)))
    }
}

#Preview {
    Moon()
}
