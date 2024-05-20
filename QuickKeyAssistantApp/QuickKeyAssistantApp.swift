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
            MenuView()
        } label: {
            if let image = NSImage().resizeImage(named: "MenuIcon", to: NSSize(width: 18, height: 18)) {
                Image(nsImage: image)
            } else {
                Text("？")
            }
        }
        .menuBarExtraStyle(.window)
    }
}
