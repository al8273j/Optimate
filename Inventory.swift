//
//  Inventory.swift
//  idk
//
//  Created by Alyssa King on 1/16/25.
//

import SwiftUI





struct Inventory: View {
    @State private var value = 0
    
    
   

    func incrementStep() {
        value += 1
        if value >= 10 { value = 0 }
        //replace ten v variable depending on option
    }

    func decrementStep() {
        value -= 1
        if value < 0 { value = 10 - 1 }
    }

    var body: some View {
        HStack{}
            .navigationTitle("Inventory")
        
        
        NavigationLink("Add New Item", destination: ItemChoice())
                        .padding()
        .padding()
        VStack{
            
            Stepper {
                Text("Quantity: \(value)")
            } onIncrement: {
                incrementStep()
            } onDecrement: {
                decrementStep()
            }
            .padding(5)
            
            DisclosureGroup("Product Info")
            {
                
                Text("Sub-item 1")
            }
            
            
        }}
}

//category feature
    
// eye drops drop down box with info like brand, exp date bla bla bla //notify when exp date approaches //notify when
    // have delete button
// contacts
// eye contact solution
// other

enum Planet: String, CaseIterable, Identifiable {
    case Contacts, EyeDrops, Solution, Other
    var id: Self { self }
}
enum ScreenType: String, CaseIterable {
    case home = "Home"
    case analytics = "Analytics"
    case Other = "Settings"
}
struct ItemChoice: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var selectedPlanet: Planet = .Contacts
    @State private var selectedScreen: ScreenType = .home
    
    var body: some View{
        
        NavigationStack {
                    List {
                        Picker("Planet", selection: $selectedPlanet) {
                            ForEach(Planet.allCases) { planet in
                                Text(planet.rawValue.capitalized)
                            }
                        }
                    }
                }
        .pickerStyle(.segmented)
        switch selectedScreen {
                    case .home:
            AnalyticsDetailView()
                    case .analytics:
            AnalyticsDetailView()
                    case .Other:
            Time()
                    }
                    
                    Spacer()
        
        VStack{
            Button("Save"){
                presentationMode.wrappedValue.dismiss()
            }
        }
        
        
    }
}
