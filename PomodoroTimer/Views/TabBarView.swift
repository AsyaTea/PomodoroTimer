//
//  TabBarView.swift
//  PomodoroTimer
//
//  Created by Asya Tealdi on 04/09/2024.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            
            TimerView()
                .tabItem {
                    Label("Timer", systemImage: "list.dash")
                }
            TimerPageView()
                .tabItem {
                    Label("Explore", systemImage: "square.and.pencil")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "square.and.pencil")
                }
        }
    }
}

#Preview {
    TabBarView()
}
