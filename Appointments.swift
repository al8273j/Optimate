import SwiftUI
import Foundation
struct Appointments: View {
    @State private var upcomingdate = Date()
    @State private var upcomingappts: [Date] = []
    @State private var pastappts: [Date] = []
    
   // Specify your desired format

        //   let dateString = formatter.string(from: date)
    
    let upcomingdateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let currentDate = Date()
        let startComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: currentDate)
        let endComponents = DateComponents(year: 2026, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
        ...
        calendar.date(from:endComponents)!
    }()
    
    @State private var pastdate = Date()
    
    
    
    let pastdateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let currentDate = Date()
        let startComponents = DateComponents(year: 2021, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        let endComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: currentDate)
        return calendar.date(from:startComponents)!
        ...
        calendar.date(from:endComponents)!
    }()
    
    
    var body: some View {
        ScrollView{
            VStack{
                HStack {
                    Text("Upcoming Appointments")
                        .frame(alignment: .leading)
                        .padding()
                        .bold()
                    Spacer()
                }
                .navigationTitle("Appointment Details")
                
                Spacer()
                    .frame(height: 30)
                DatePicker(
                    "Date",
                    selection: $upcomingdate,
                    in: upcomingdateRange,
                    displayedComponents: [.date, .hourAndMinute]
                )
                
                VStack{
                    Button("Add Upcoming Appointment", systemImage:"plus") {
                        upcomingappts.append(upcomingdate)
                        
                        
                        // Get the current date
                        let currentDate = Date()
                        
                        
                        
                        let currentTimeBefore = upcomingdate.timeIntervalSince(currentDate)
                        
                        
                        //notify one week before
                        let oneWeekBefore = Calendar.current.date(byAdding: .day, value: -7, to: upcomingdate)!
                        
                        
                        let secsOneWeekBefore = oneWeekBefore.timeIntervalSince(currentDate)
                        
                        if currentTimeBefore > secsOneWeekBefore && secsOneWeekBefore > 0 {
                            scheduleNotification(id: formatDate(upcomingdate), interval: secsOneWeekBefore)
                            
                        }
                        
                        //notify one day before
                        let oneDayBefore = Calendar.current.date(byAdding: .day, value: -1, to: upcomingdate)!
                        
                        
                        let secsOneDayBefore = oneDayBefore.timeIntervalSince(currentDate)
                        
                        
                        if currentTimeBefore > secsOneDayBefore && secsOneDayBefore > 0 {
                            scheduleNotification(id: formatDate(upcomingdate), interval: secsOneDayBefore)
                            
                        }
                        
                        
                        
                        let twoHoursBefore = Calendar.current.date(byAdding: .hour, value: -2, to: upcomingdate)!
                        
                        
                        let secsTwoHoursBefore = twoHoursBefore.timeIntervalSince(currentDate)
                        
                     //   if currentTimeBefore > twoHoursBefore && secsTwoHoursBefore > 0 {
                            
                            scheduleNotification(id: formatDate(upcomingdate), interval: secsTwoHoursBefore)
                     //   }
                        
                        

                        
                        
                        
                    }
                    .padding()
                    
                    List {
                        ForEach(upcomingappts, id: \.self) { next in
                            Text(formatDate(upcomingdate))
                            
                            
                            
                            
                        }.onDelete { indexSet in
                            for index in indexSet {
                                // Access the item being deleted
                                let appointmentToDelete = upcomingappts[index]
                                
                                // Process or log the appointment (e.g., convert to string if it's a Date)
                                cancelNotification(id: formatDate(appointmentToDelete))
                            }
                            
                            // Remove the item(s) from the array
                            upcomingappts.remove(atOffsets: indexSet)
                        }

                    }
                    .frame(height: 150)
                    //on click basically append to a list of existing dates on
                    
                }
                HStack {
                    Text("Past Appointments")
                        .frame(alignment: .leading)
                        .padding()
                        .bold()
                    Spacer()
                }
                
                DatePicker(
                    "Date",
                    selection: $pastdate,
                    in: pastdateRange,
                    displayedComponents: [.date, .hourAndMinute]
                )
                
                VStack{
                    Button("Log Past Appointment", systemImage:"plus") {
                        pastappts.append(pastdate)
                        
                        //  Text("swipe right to delete")
                    }
                    .padding()
                    
                    List {
                        ForEach(pastappts, id: \.self) { next in
                            Text(formatDate(pastdate))
                        }.onDelete { indexSet in
                            pastappts.remove(atOffsets: indexSet)
                        }
                    }
                    .frame(height: 150)
                    //on click basically append to a list of existing dates on
                    
                }
                
                
                
                
                
                
            }
            Spacer()
        }}
    func addAppointment() {
        print("added")
    }
    
    func scheduleNotification(id: String, interval: TimeInterval) {
        // Create notification content
        let content = UNMutableNotificationContent()
        content.title = "Appointment Soon!"
        content.body = "TYou have a doctors appointment approaching!"
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
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy h:mm a"
        return formatter.string(from: date)
    }

    
    //log past appointments
    //have delete option w red trash can and delet udnerlines
    //lets say i wanted to schedule notifications for an appointment, would they have to be non repeating appointments where i create a uniqe id for each appointment so that they can be deleted seprarately if the user chooses?
    
}

#Preview{
    Appointments()
}
