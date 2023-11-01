//
//  ContentView.swift
//  FireSlider
//
//  Created by Franco Fantillo on 2023-09-18.
//

import SwiftUI

struct SliderView: View {
    
    @State var percent: Float = 50
    
    var body: some View {
        ZStack {
            try! ParticleView(node: "Fire2", percent: $percent)
                .edgesIgnoringSafeArea(.all)
            CustomSlider(percentage: $percent)
                .frame(width: 200, height: 44)
                .offset(y: 70)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white, radius: 10, x: -5, y: -5)
        }
        .edgesIgnoringSafeArea(.all)
        .padding()
        .background(Color("AccentColor"))
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
            .edgesIgnoringSafeArea(.all)
    }
}
