//
//  idkApp.swift
//  idk
//
//  Created by Alyssa King on 1/14/25.
//

import SwiftUI

// ObservableObject to share timer settings across views
class TimerSettings: ObservableObject {
    @Published var hours: Int = 8
    @Published var minutes: Int = 0
    @Published var seconds: Int = 0

    // Computed property to calculate total seconds
    var totalSeconds: TimeInterval {
        return TimeInterval((hours * 3600) + (minutes * 60) + seconds)
    }
}

@main
struct idkApp: App {
    @StateObject private var settings = TimerSettings() // Create an instance of TimerSettings
    init() {
        requestNotificationPermission()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView { // Wrap the initial view in a NavigationView for navigation
                ContentView()
            }
            .environmentObject(settings) // Inject the TimerSettings into the environment
        }
    }
    private func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("Notification permissions granted!")
            } else if let error = error {
                print("Failed to request permissions: \(error.localizedDescription)")
            }
        }
    }}
