//
//  CustomSlider.swift
//  FireSlider
//
//  Created by Franco Fantillo on 2023-09-18.
//

import SwiftUI

struct CustomSlider: View {
    
    @Binding var percentage: Float
    
    let hotGradient = LinearGradient(colors: [.orange, .red], startPoint: .topLeading, endPoint: .bottomTrailing)

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(Color("AccentColor"))
                }
                .cornerRadius(geometry.size.height/2)
            }
            
            ZStack {
                Circle()
                    .fill(hotGradient)
                Image(systemName: "flame")
                    .foregroundColor(.white)
            }
            .position(CGPoint(x: ((geometry.size.width - geometry.size.height) * CGFloat(self.percentage / 100)) + geometry.size.height/2, y:  geometry.size.height/2))
            .gesture(DragGesture(minimumDistance: 0)
                .onChanged({ value in
                    // TODO: - maybe use other logic here
                    self.percentage = min(max(0, Float(value.location.x / geometry.size.width * 100)), 100)
                }))
        }
    }
}

struct CustomSlider_Previews: PreviewProvider {
    static var previews: some View {
        
        CustomSlider(percentage: .constant(0))
            .frame(width: 200, height: 44)
    }
}
