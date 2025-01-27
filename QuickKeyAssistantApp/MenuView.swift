//
//  MenuView.swift
//  QuickKeyAssistantApp
//
//  Created by 村石 拓海 on 2024/05/19.
//

import SwiftUI

struct MenuView: View {
    @State private var isHoveredGitHub = false
    @State private var isHoveredSlack = false
    @State private var isHoveredAbout = false
    @State private var isHoveredQuit = false
    
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
                    
                    Text("⌘ R")
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
                    Text("Focus SearchBar")
                    
                    Spacer()
                    
                    Text("S or /")
                        .foregroundStyle(.gray)
                }
                
                HStack {
                    Text("Notifications")
                    
                    Spacer()
                    
                    Text("G N")
                        .foregroundStyle(.gray)
                }
                
                HStack {
                    Text("Command Palette")
                    
                    Spacer()
                    
                    Text("⌘ K")
                        .foregroundStyle(.gray)
                }
                
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
                
                ZStack(alignment: .leading) {
                    if isHoveredGitHub {
                        Color.gray.opacity(0.3)
                    }
                    Text("Official Documents")
                        .onHover { hovered in
                            self.isHoveredGitHub = hovered
                        }
                        .onTapGesture {
                            if let url = URL(string: "https://docs.github.com/en/get-started/accessibility/keyboard-shortcuts") {
                                NSWorkspace.shared.open(url)
                            }
                        }
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
                    if isHoveredSlack {
                        Color.gray.opacity(0.3)
                    }
                    Text("Official Documents")
                        .onHover { hovered in
                            self.isHoveredSlack = hovered
                        }
                        .onTapGesture {
                            if let url = URL(string: "https://slack.com/intl/en-gb/help/articles/201374536-Slack-keyboard-shortcuts-and-commands") {
                                NSWorkspace.shared.open(url)
                            }
                        }
                }
                
                Divider()
                
                ZStack(alignment: .leading) {
                    if isHoveredAbout {
                        Color.gray.opacity(0.3)
                    }
                    
                    HStack {
                        Text("About QuickKeyAssistant")
                        
                        Spacer()
                    }
                    .onHover { hovered in
                        self.isHoveredAbout = hovered
                    }
                    .onTapGesture {
                        NSApp.activate(ignoringOtherApps: true)
                        NSApp.orderFrontStandardAboutPanel()
                    }

                }
                
                ZStack(alignment: .leading) {
                    if isHoveredQuit {
                        Color.gray.opacity(0.3)
                    }
                    
                    HStack {
                        Text("Quit")
                        
                        Spacer()
                        
                        Text("⌘ Q")
                            .foregroundStyle(.gray)
                    }
                    .onHover { hovered in
                        self.isHoveredQuit = hovered
                    }
                    .onTapGesture {
                        NSApplication.shared.terminate(nil)
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
