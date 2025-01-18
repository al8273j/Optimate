import SwiftUI

struct Browse: View {
    var body: some View {
        NavigationView {
            List {
                Section{
                    // Analytics Card
                    NavigationLink(destination: AnalyticsDetailView()) {
                        HStack {
                            Image(systemName: "chart.bar") // Bar chart icon
                                .foregroundColor(.blue)
                                .font(.title2)
                            Text("Analytics")
                                .font(.headline)
                            Spacer()
                            
                        }
                        .padding()
                    }
                }
                
                // Inventory Card
                Section {
                    NavigationLink(destination: Inventory()) {
                        HStack {
                            Image(systemName: "archivebox") // Inventory icon
                                .foregroundColor(.green)
                                .font(.title2)
                            Text("Inventory")
                                .font(.headline)
                            Spacer()
                            
                        }
                        .padding()
                    }
                }
                Section {
                    
                    NavigationLink(destination: InventoryDetailView()) {
                        HStack {
                            Image(systemName: "heart") // Inventory icon
                                .foregroundColor(.pink)
                                .font(.title2)
                            Text("Care Guide")
                                .font(.headline)
                            Spacer()
                            
                        }
                        .padding()
                    }
                }
                Section {
                    
                    NavigationLink(destination: Appointments()) {
                        HStack {
                            Image(systemName: "pill") // Inventory icon
                                .foregroundColor(.red)
                                .font(.title2)
                            Text("Appointments")
                                .font(.headline)
                            Spacer()
                            
                        }
                        .padding()
                    }
                }
                Section {
                    NavigationLink(destination: InventoryDetailView()) {
                        HStack {
                            Image(systemName: "book") // Inventory icon
                                .foregroundColor(.yellow)
                                .font(.title2)
                            Text("Notes")
                                .font(.headline)
                            Spacer()
                            
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Dashboard")
        }
    }
}

struct AnalyticsDetailView: View {
    var body: some View {
        VStack {
            Text("Analytics Details")
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .navigationTitle("Analytics")
    }
}

struct InventoryDetailView: View {
    var body: some View {
        VStack {
            Text("Inventory Details")
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .navigationTitle("Inventory")
    }
}

//disclosure group

