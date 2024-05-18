//
//  ContentView.swift
//  QuickKeyAssistantApp
//
//  Created by 村石 拓海 on 2024/05/19.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: QuickKeyAssistantAppDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

#Preview {
    ContentView(document: .constant(QuickKeyAssistantAppDocument()))
}
