//
//  SceneTestApp.swift
//  SceneTest
//
//  Created by Franco Fantillo on 2023-09-19.
//

import SwiftUI

@main
struct SceneTestApp: App {
    var body: some Scene {
        WindowGroup {
            PlanetView()
                .ignoresSafeArea(.all)
        }
    }
}
