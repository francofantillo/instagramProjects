//
//  SliderDimmerApp.swift
//  SliderDimmer
//
//  Created by Franco Fantillo on 2023-10-04.
//

import SwiftUI

@main
struct SliderDimmerApp: App {
    var body: some Scene {
        WindowGroup {
            AdjustLights(startingSliderValue: 50, automationMode: false, hideBackButton: true)
        }
    }
}
