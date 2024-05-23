//
//  SettingView.swift
//  QuickKeyAssistantApp
//
//  Created by 村石 拓海 on 2024/05/23.
//

import SwiftUI

struct SettingView: View {
    @AppStorage("yourName") var yourName = "User"
    
    var body: some View {
        TabView {
            Form {
                TextField("YourName", text: $yourName)
            }
            .padding(20)
            .tabItem {
                Label("一般", systemImage: "slider.horizontal.3")
            }
        }
        .frame(width: 500, height: .none)
    }
}

#Preview {
    SettingView()
}
