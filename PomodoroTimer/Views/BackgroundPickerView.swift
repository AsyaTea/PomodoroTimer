//
//  BackgroundPickerView.swift
//  PomodoroTimer
//
//  Created by Asya Tealdi on 04/09/2024.
//

import SwiftUI

struct BackgroundPickerView: View {
    @State private var selectedBackground: BackgroundModel = availableBackgrounds.first!

    var body: some View {
        VStack {
            selectedBackground.image
                .resizable()
                .scaledToFill()
                .frame(height: 300)
                .clipped()
            
            Picker("Select Background", selection: $selectedBackground) {
                ForEach(availableBackgrounds) { background in
                    Text(background.name).tag(background)
                }
            }
            .pickerStyle(WheelPickerStyle())
        }
    }
}


#Preview {
    BackgroundPickerView()
}
