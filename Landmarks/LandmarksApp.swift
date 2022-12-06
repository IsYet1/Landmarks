//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Don McKenzie on 11/6/22.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
