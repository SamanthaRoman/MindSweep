//
//  MindSweepApp.swift
//  MindSweep
//
//  Created by Samantha Roman on 4/25/26.
//

import SwiftUI

@main
struct MindSweepApp: App {
    @StateObject private var store = ThoughtStore()

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(store)
        }
    }
}
