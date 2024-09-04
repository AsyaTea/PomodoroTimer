//
//  TimerViewModel.swift
//  PomodoroTimer
//
//  Created by Asya Tealdi on 04/09/2024.
//

import SwiftUI
import Combine

class TimerViewModel: ObservableObject {
    @Published private var model: TimerModel
    @Published var timerText: String = "25:00"
    @Published var progress: Float = 1.0
    @Published var isRunning: Bool = false
    private var timer: AnyCancellable?

    init(template: TemplateModel = availableTemplates.first!) {
        // Initialize the TimerModel with the template's work duration
        self.model = TimerModel(duration: template.workDuration, remainingTime: template.workDuration)
        self.updateView()
    }

    func toggleTimer() {
        if model.isRunning {
            pauseTimer()
        } else {
            startTimer()
        }
    }

    private func startTimer() {
        model.isRunning = true
        isRunning = true
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.updateTimer()
            }
    }

    private func pauseTimer() {
        model.isRunning = false
        isRunning = false
        timer?.cancel()
    }

    func resetTimer(with template: TemplateModel) {
        pauseTimer()
        model.reset(with: template)
        updateView()
    }

    private func updateTimer() {
        if model.remainingTime > 0 {
            model.remainingTime -= 1
            updateView()
        } else {
            timer?.cancel()
            model.isRunning = false
            isRunning = false
        }
    }

    private func updateView() {
        let minutes = Int(model.remainingTime) / 60
        let seconds = Int(model.remainingTime) % 60
        timerText = String(format: "%02d:%02d", minutes, seconds)
        progress = Float(model.elapsedTime) / Float(model.duration)
    }
}

