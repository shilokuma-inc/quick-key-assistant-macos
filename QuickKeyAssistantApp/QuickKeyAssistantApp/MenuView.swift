//
//  MenuView.swift
//  QuickKeyAssistantApp
//
//  Created by 村石 拓海 on 2024/05/19.
//

import SwiftUI

struct MenuView: View {
    @State private var isHovered = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                Text("Xcode")
                    .foregroundStyle(.gray)
                
                HStack {
                    Text("Run")
                    
                    Spacer()
                    
                    Text("⌘ R")
                        .foregroundStyle(.gray)
                }
                
                HStack {
                    Text("Test")
                    
                    Spacer()
                    
                    Text("⌘ U")
                        .foregroundStyle(.gray)
                }
                
                HStack {
                    Text("Build")
                    
                    Spacer()
                    
                    Text("⌘ B")
                        .foregroundStyle(.gray)
                }
                
                HStack {
                    Text("Comment out")
                    
                    Spacer()
                    
                    Text("⌘ /")
                        .foregroundStyle(.gray)
                }
                
                HStack {
                    Text("Indentation")
                    
                    Spacer()
                    
                    Text("^ I")
                        .foregroundStyle(.gray)
                }
                
                HStack {
                    Text("Rename")
                    
                    Spacer()
                    
                    Text("⌘ ^ E")
                        .foregroundStyle(.gray)
                }
                
                Divider()
                
                Text("Simulator")
                    .foregroundStyle(.gray)
                
                HStack {
                    Text("Screenshot")
                    
                    Spacer()
                    
                    Text("⌘ S")
                        .foregroundStyle(.gray)
                }
                
                HStack {
                    Text("Record")
                    
                    Spacer()
                    
                    Text("⌘ S")
                        .foregroundStyle(.gray)
                }
                
                HStack {
                    Text("Home")
                    
                    Spacer()
                    
                    Text("⌘ ⇧ H")
                        .foregroundStyle(.gray)
                }
                
                HStack {
                    Text("Lock")
                    
                    Spacer()
                    
                    Text("⌘ L")
                        .foregroundStyle(.gray)
                }
                
                HStack {
                    Text("Rotate LR")
                    
                    Spacer()
                    
                    Text("⌘ ←→")
                        .foregroundStyle(.gray)
                }
                
                HStack {
                    Text("Shake")
                    
                    Spacer()
                    
                    Text("⌘ ^ Z")
                        .foregroundStyle(.gray)
                }
                
                HStack {
                    Text("Keyboard I/O")
                    
                    Spacer()
                    
                    Text("⌘ K")
                        .foregroundStyle(.gray)
                }
                
                HStack {
                    Text("Input Mac Keyboard")
                    
                    Spacer()
                    
                    Text("⌘ ⇧ K")
                        .foregroundStyle(.gray)
                }
                
                Divider()
                
                Text("GitHub")
                    .foregroundStyle(.gray)
                
                HStack {
                    Text("Issue Tab")
                    
                    Spacer()
                    
                    Text("G I")
                        .foregroundStyle(.gray)
                }
                
                HStack {
                    Text("Pull requets Tab")
                    
                    Spacer()
                    
                    Text("G P")
                        .foregroundStyle(.gray)
                }
                
                Divider()
                
                Text("Slack")
                    .foregroundStyle(.gray)
                
                HStack {
                    Text("All read")
                    
                    Spacer()
                    
                    Text("⇧ esc")
                        .foregroundStyle(.gray)
                }
                
                ZStack(alignment: .leading) {
                    if isHovered {
                        Color.gray.opacity(0.3)
                    }
                    Text("Official Documents")
                        .onHover { hovered in
                            self.isHovered = hovered
                        }
                        .onTapGesture {
                            if let url = URL(string: "https://slack.com/intl/en-gb/help/articles/201374536-Slack-keyboard-shortcuts-and-commands") {
                                NSWorkspace.shared.open(url)
                            }
                        }
                }
            }
            .padding(16)
        }
        .frame(width: 200)
        .frame(maxHeight: 400)
    }
}

#Preview {
    MenuView()
}
