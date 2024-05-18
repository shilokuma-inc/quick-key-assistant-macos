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
        DocumentGroup(newDocument: QuickKeyAssistantAppDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
