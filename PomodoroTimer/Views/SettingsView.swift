//
//  SettingsView.swift
//  PomodoroTimer
//
//  Created by Asya Tealdi on 04/09/2024.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("defaultTemplate") private var defaultTemplate: String = "25/5"

    var body: some View {
        Form {
            Picker("Default Timer Template", selection: $defaultTemplate) {
                ForEach(availableTemplates) { template in
                    Text(template.name).tag(template.name)
                }
            }
            BackgroundPickerView()
        }
    }
}


#Preview {
    SettingsView()
}
