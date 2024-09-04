//
//  Template.swift
//  PomodoroTimer
//
//  Created by Asya Tealdi on 04/09/2024.
//

import Foundation

// TemplateModel represents a timer template with work and break durations
struct TemplateModel: Identifiable, Hashable {
    // Unique identifier for each template
    var id: UUID = UUID()
    // Name of the template (e.g., "Pomodoro", "Long Break")
    var name: String
    // Duration of the work interval in seconds
    var workDuration: TimeInterval
    // Duration of the break interval in seconds
    var breakDuration: TimeInterval

    // Computed property to get the total cycle duration (work + break)
    var totalCycleDuration: TimeInterval {
        return workDuration + breakDuration
    }
}

// Example of predefined templates
let availableTemplates: [TemplateModel] = [
    TemplateModel(name: "Pomodoro", workDuration: 25 * 60, breakDuration: 5 * 60),
    TemplateModel(name: "Short Break", workDuration: 15 * 60, breakDuration: 5 * 60),
    TemplateModel(name: "Long Break", workDuration: 50 * 60, breakDuration: 10 * 60),
    TemplateModel(name: "Custom", workDuration: 30 * 60, breakDuration: 10 * 60)
]

