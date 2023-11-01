//
//  FireSliderApp.swift
//  FireSlider
//
//  Created by Franco Fantillo on 2023-09-18.
//

import SwiftUI

@main
struct FireSliderApp: App {
    var body: some Scene {
        WindowGroup {
            SliderView()
                .background(Color.gray)
                .edgesIgnoringSafeArea(.all)

        }
    }
}
