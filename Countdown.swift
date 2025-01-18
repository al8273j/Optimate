import SwiftUI

struct Countdown: View {
    @EnvironmentObject var settings: TimerSettings
    @Environment(\.presentationMode) var presentationMode // Used to dismiss the view

    @State private var selectedHours: Int = 0 // Temporary state for hours
    @State private var selectedMinutes: Int = 0 // Temporary state for minutes
    @State private var selectedSeconds: Int = 0 // Temporary state for seconds

    var body: some View {
        VStack {
            HStack {
                Text("Hour")
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 40)
                Text("Minute")
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)
                Text("Second")
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 40)
            }

            HStack {
                Picker("Hours", selection: $selectedHours) {
                    ForEach(0...23, id: \.self) { hour in
                        Text("\(hour)").tag(hour)
                    }
                }
                .pickerStyle(.wheel)

                Picker("Minutes", selection: $selectedMinutes) {
                    ForEach(0...59, id: \.self) { minute in
                        Text("\(minute)").tag(minute)
                    }
                }
                .pickerStyle(.wheel)

                Picker("Seconds", selection: $selectedSeconds) {
                    ForEach(0...59, id: \.self) { second in
                        Text("\(second)").tag(second)
                    }
                }
                .pickerStyle(.wheel)
            }

            Button("Save") {
                // Update the shared settings and dismiss the view
                settings.hours = selectedHours
                settings.minutes = selectedMinutes
                settings.seconds = selectedSeconds
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
        }
        .onAppear {
            // Initialize temporary state with current settings
            selectedHours = settings.hours
            selectedMinutes = settings.minutes
            selectedSeconds = settings.seconds
        }
    }
}
