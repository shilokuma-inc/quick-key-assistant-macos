//
//  SettingView.swift
//  QuickKeyAssistantApp
//
//  Created by 村石 拓海 on 2024/05/23.
//

import SwiftUI

struct SettingView: View {
    @AppStorage("yourName") var yourName = "User"
    @AppStorage(ToolVisibility.storageKey) private var hiddenToolSectionIDs = ""
    
    var body: some View {
        TabView {
            Form {
                TextField("YourName", text: $yourName)
                
                Section("Tools") {
                    ForEach(ToolSection.all) { section in
                        Toggle(section.name, isOn: isVisible(section))
                    }
                }
            }
            .padding(20)
            .tabItem {
                Label("一般", systemImage: "slider.horizontal.3")
            }
        }
        .frame(width: 500, height: .none)
    }
    
    private func isVisible(_ section: ToolSection) -> Binding<Bool> {
        Binding(
            get: { !ToolVisibility.hiddenIDs(from: hiddenToolSectionIDs).contains(section.id) },
            set: { hiddenToolSectionIDs = ToolVisibility.setHidden(!$0, id: section.id, in: hiddenToolSectionIDs) }
        )
    }
}

#Preview {
    SettingView()
}
