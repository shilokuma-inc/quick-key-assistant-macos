//
//  MenuView.swift
//  QuickKeyAssistantApp
//
//  Created by 村石 拓海 on 2024/05/19.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                Text("Xcode")
                    .foregroundStyle(.gray)
                
                HStack {
                    Text("Run")
                    
                    Spacer()
                    
                    Text("⌘ + R")
                        .foregroundStyle(.gray)
                }
                
                HStack {
                    Text("Test")
                    
                    Spacer()
                    
                    Text("⌘ + U")
                        .foregroundStyle(.gray)
                }
                
                Divider()
                
                Text("GitHub")
                    .foregroundStyle(.gray)
                
                HStack {
                    Text("Issue Tab")
                    
                    Spacer()
                    
                    Text("G > I")
                        .foregroundStyle(.gray)
                }
                
                HStack {
                    Text("Pull requets Tab")
                    
                    Spacer()
                    
                    Text("G > P")
                        .foregroundStyle(.gray)
                }
                
                Divider()
                
                Text("Slack")
                    .foregroundStyle(.gray)
                
                HStack {
                    Text("All read")
                    
                    Spacer()
                    
                    Text("⇧ + esc")
                        .foregroundStyle(.gray)
                }
            }
            .padding(16)
        }
        .frame(width: 200)
    }
}

#Preview {
    MenuView()
}
