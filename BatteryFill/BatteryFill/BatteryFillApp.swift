//
//  BatteryFillApp.swift
//  BatteryFill
//
//  Created by Franco Fantillo on 2023-10-26.
//

import SwiftUI

@main
struct BatteryFillApp: App {
    var body: some Scene {
        WindowGroup {
            BatteryAnimation()
                .background(.black)
                .edgesIgnoringSafeArea(.all)
        }
    }
}
