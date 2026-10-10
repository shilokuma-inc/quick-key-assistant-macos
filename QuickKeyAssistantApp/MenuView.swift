//
//  MenuView.swift
//  QuickKeyAssistantApp
//
//  Created by 村石 拓海 on 2024/05/19.
//

import SwiftUI

struct MenuView: View {
    @State private var hoveredDocumentSection: ToolSection.ID?
    @State private var isHoveredAbout = false
    @State private var isHoveredQuit = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                ForEach(ToolSection.all) { section in
                    Text(section.name)
                        .foregroundStyle(.gray)
                    
                    ForEach(section.shortcuts, id: \.self) { shortcut in
                        HStack {
                            Text(shortcut.name)
                            
                            Spacer()
                            
                            Text(shortcut.keys)
                                .foregroundStyle(.gray)
                        }
                    }
                    
                    if let documentURL = section.documentURL {
                        ZStack(alignment: .leading) {
                            if hoveredDocumentSection == section.id {
                                Color.gray.opacity(0.3)
                            }
                            Text("Official Documents")
                                .onHover { hovered in
                                    if hovered {
                                        self.hoveredDocumentSection = section.id
                                    } else if self.hoveredDocumentSection == section.id {
                                        self.hoveredDocumentSection = nil
                                    }
                                }
                                .onTapGesture {
                                    NSWorkspace.shared.open(documentURL)
                                }
                        }
                    }
                    
                    Divider()
                }
                
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
