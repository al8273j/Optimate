import SwiftUI

struct Time: View {
    @EnvironmentObject var settings: TimerSettings
    @State private var currentTime: TimeInterval = 0
    @State private var isTimerRunning = false
    @State private var timer: Timer?

    var timeFormatted: String {
        let totalSeconds = max(0, Int(currentTime))
        let hours = totalSeconds / 3600
        let minutes = (totalSeconds % 3600) / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    

    var body: some View {
        VStack {
            
            Text("Remove your contacts in")
            Text(timeFormatted)
                .font(.largeTitle)
                .padding()

            HStack {
                Button(action: toggleTimer) {
                    Text(isTimerRunning ? "Pause" : "Play")
                }
                .padding()
                Button(action: resetTimer) {
                    Text("Reset")
                }
                .padding()
            }

            NavigationLink("Settings", destination: Countdown())
                            .padding()
        }
        .onAppear {
            resetTimer()
        }
        .navigationTitle("Timer")
    }
    
    func toggleTimer() {
        if isTimerRunning {
            timer?.invalidate()
            
            cancelNotification(id: "timerNotification")
            
        } else {
          
            scheduleNotification(id: "timerNotification", interval: currentTime)
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if currentTime > 0 {
                    currentTime -= 1
                } else {
                    timer?.invalidate()
                    isTimerRunning = false
                    cancelNotification(id: "timerNotification")
                }
            }
        }
        isTimerRunning.toggle()
    }

    func resetTimer() {
        timer?.invalidate()
        currentTime = settings.totalSeconds
        isTimerRunning = false
        cancelNotification(id: "timerNotification")
    }
    
    func scheduleNotification(id: String, interval: TimeInterval) {
        // Create notification content
        let content = UNMutableNotificationContent()
        content.title = "Contacts!"
        content.body = "Time to take those contacts out!"
        content.sound = .default

        // Create a time-based trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: interval, repeats: false)

        // Create a request with the provided ID
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)

        // Add the request to the notification center
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            }
        }
    }
    
    func cancelNotification(id: String) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [id])
    }
    
    
}




// initialize notification with timer speific id
// if isTimer Running, timer interval for notif is current time, if  timer is not running, cancel notif
