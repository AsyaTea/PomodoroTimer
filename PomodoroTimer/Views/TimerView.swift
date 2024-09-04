//
//  TimerView.swift
//  PomodoroTimer
//
//  Created by Asya Tealdi on 04/09/2024.
//

import SwiftUI

struct TimerView: View {
    @StateObject private var viewModel = TimerViewModel()
    @State private var selectedTemplate: TemplateModel = availableTemplates.first!

    var body: some View {
        VStack {
            Picker("Select Template", selection: $selectedTemplate) {
                ForEach(availableTemplates) { template in
                    Text(template.name).tag(template)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Spacer()
            
            Text(viewModel.timerText)
                .font(.largeTitle)
                .padding()

            ProgressView(value: viewModel.progress)
                .progressViewStyle(LinearProgressViewStyle())
                .padding()

            Spacer()

            HStack {
                Button(viewModel.isRunning ? "Pause" : "Start") {
                    viewModel.toggleTimer()
                }
                .padding()

                Button("Reset") {
                    viewModel.resetTimer(with: selectedTemplate)
                }
                .padding()
            }
        }
        .onChange(of: selectedTemplate) { newTemplate in
            viewModel.resetTimer(with: newTemplate)
        }
    }
}



#Preview {
    TimerView()
}
