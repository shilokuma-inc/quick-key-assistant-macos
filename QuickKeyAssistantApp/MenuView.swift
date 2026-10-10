//
//  MenuView.swift
//  QuickKeyAssistantApp
//
//  Created by 村石 拓海 on 2024/05/19.
//

import SwiftUI

struct MenuView: View {
    @AppStorage("selectedToolSectionID") private var selectedSectionID = ToolSection.all.first?.id ?? ""
    @AppStorage(ToolVisibility.storageKey) private var hiddenToolSectionIDs = ""
    @State private var isHoveredDocument = false
    @State private var isHoveredAbout = false
    @State private var isHoveredQuit = false
    @State private var copiedShortcut: Shortcut?
    @State private var copyID = UUID()
    
    private var visibleSections: [ToolSection] {
        ToolVisibility.visibleSections(ToolSection.all, hiddenRawValue: hiddenToolSectionIDs)
    }
    
    private var selectedSection: ToolSection? {
        ToolSection.section(id: selectedSectionID, in: visibleSections)
    }
    
    private var sectionSelection: Binding<ToolSection.ID> {
        Binding(
            get: { selectedSection?.id ?? "" },
            set: { selectedSectionID = $0 }
        )
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                if visibleSections.isEmpty {
                    Text("No tools to show. Turn on tools in Settings.")
                        .foregroundStyle(.gray)
                    
                    Divider()
                } else {
                    Picker("Tool", selection: sectionSelection) {
                        ForEach(visibleSections) { section in
                            Text(section.name)
                                .tag(section.id)
                        }
                    }
                    .pickerStyle(.menu)
                    .labelsHidden()
                }
                
                if let section = selectedSection {
                    ForEach(section.shortcuts, id: \.self) { shortcut in
                        HStack {
                            Text(shortcut.name)
                            
                            Spacer()
                            
                            if copiedShortcut == shortcut {
                                Text("Copied")
                                    .foregroundStyle(Color.accentColor)
                            } else {
                                Text(shortcut.keys)
                                    .foregroundStyle(.gray)
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            copy(shortcut)
                        }
                    }
                    
                    if let documentURL = section.documentURL {
                        ZStack(alignment: .leading) {
                            if isHoveredDocument {
                                Color.gray.opacity(0.3)
                            }
                            Text("Official Documents")
                                .onHover { hovered in
                                    self.isHoveredDocument = hovered
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
    
    private func copy(_ shortcut: Shortcut) {
        ShortcutClipboard.copy(shortcut)
        copiedShortcut = shortcut
        let id = UUID()
        copyID = id
        DispatchQueue.main.asyncAfter(deadline: .now() + ShortcutClipboard.copiedMessageDuration) {
            // 後から別のコピー（同じ項目の再コピーを含む）があれば、その表示時間を優先する
            if copyID == id {
                copiedShortcut = nil
            }
        }
    }
}

#Preview {
    MenuView()
}
