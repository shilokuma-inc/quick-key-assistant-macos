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
//            let image: NSImage = {
//                let ratio = $0.size.height / $0.size.width
//                $0.size.height = 18
//                $0.size.width = 18 / ratio
//                return $0
//            }(NSImage(named: "MenuIcon")!)
//
//            Image(nsImage: image)
            if let image = NSImage().resizeImage(named: "MenuIcon", to: NSSize(width: 18, height: 18)) {
                Image(nsImage: image)
            } else {
                Text("？")
            }
        }
        WindowGroup {
            ContentView()
        }
    }
}
