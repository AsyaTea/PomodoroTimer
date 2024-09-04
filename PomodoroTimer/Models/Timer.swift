//
//  Timer.swift
//  PomodoroTimer
//
//  Created by Asya Tealdi on 04/09/2024.
//

import Foundation

// TimerModel holds the essential data for a Pomodoro timer
struct TimerModel {
    // Total duration of the timer in seconds
    var duration: TimeInterval
    // The remaining time of the timer in seconds
    var remainingTime: TimeInterval
    // Indicates whether the timer is running or not
    var isRunning: Bool = false

    // Computed property to get the elapsed time
    var elapsedTime: TimeInterval {
        return duration - remainingTime
    }

    // Method to reset the timer
    mutating func reset(with template: TemplateModel) {
            self.duration = template.workDuration
            self.remainingTime = template.workDuration
            self.isRunning = false
        }
}
