//
//  Background.swift
//  PomodoroTimer
//
//  Created by Asya Tealdi on 04/09/2024.
//

import Foundation
import SwiftUI

// BackgroundModel represents a background option in the app
struct BackgroundModel: Identifiable, Hashable {
    // Unique identifier for each background
    var id: UUID = UUID()
    // The name of the background (e.g., "Forest", "Ocean")
    var name: String
    // The name of the image resource associated with the background
    var imageName: String
    // The name of the sound resource associated with the background (optional)
    var soundName: String?

    // Computed property to load the UIImage associated with the background
    var image: Image {
        Image(imageName)
    }

    // Computed property to load the sound file associated with the background
    var sound: URL? {
        guard let soundName = soundName else { return nil }
        return Bundle.main.url(forResource: soundName, withExtension: "mp3")
    }
}

// Example of pre-defined backgrounds
let availableBackgrounds: [BackgroundModel] = [
    BackgroundModel(name: "Forest", imageName: "Forest", soundName: "forest_sound"),
    BackgroundModel(name: "Ocean", imageName: "ocean", soundName: "ocean_sound"),
    BackgroundModel(name: "Mountain", imageName: "mountain", soundName: "mountain_sound"),
    BackgroundModel(name: "Beach", imageName: "beach", soundName: "beach_sound"),
    BackgroundModel(name: "Desert", imageName: "desert", soundName: nil) // No sound for this background
]

