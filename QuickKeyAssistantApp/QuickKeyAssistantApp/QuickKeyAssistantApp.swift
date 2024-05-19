//
//  QuickKeyAssistantApp.swift
//  QuickKeyAssistantApp
//
//  Created by 村石 拓海 on 2024/05/19.
//

import SwiftUI

@main
struct QuickKeyAssistantApp: App {
    var body: some Scene {
        MenuBarExtra {
//                    MenuView()
        } label: {
            Image(systemName: "star.fill")
        }
        WindowGroup {
            ContentView()
        }
    }
}
