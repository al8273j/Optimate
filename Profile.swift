//
//  Profile.swift
//  idk
//
//  Created by Alyssa King on 1/14/25.
//

import SwiftUI

struct Profile: View {
    @State private var leftPower: String = ""
    @State private var leftCyl: String = ""
    @State private var leftAxis: String = ""
    @State private var leftAdd: String = ""
    
    
    @State private var rightPower: String = ""
    @State private var rightCyl: String = ""
    @State private var rightAxis: String = ""
    @State private var rightAdd: String = ""
    
    @State private var showRight = false
    var body: some View{
        
        
        NavigationStack {
            
            List {
                Section {
                    VStack(alignment: .leading) {
                        Text("Power (Sph)")
                            .bold()
                        TextField(
                            "Left Eye Power",
                            text: $leftPower
                        )
                    }
                    VStack(alignment: .leading) {
                        Text("Cylinder (Cyl)")
                            .bold()
                        TextField(
                            "Left Eye Cylinder",
                            text: $leftCyl
                        )
                    }
                    
                   
                    VStack(alignment: .leading) {
                        Text("Axis")
                            .bold()
                        TextField(
                            "Left Eye Axis",
                            text: $leftAxis
                        )
                    }
                    
                    
                    VStack(alignment: .leading) {
                        Text("Addition (Add)")
                            .bold()
                        TextField(
                            "Left Eye Add",
                            text: $leftAdd
                        )
                    }
                    
                
                }
                header: {
                    Text("LEFT EYE (OS)")
                }
                
                
                
                
                Section {
                    Toggle("Same as Left", isOn: $showRight)
                    
                    
                    
                    if showRight {
                        VStack(alignment: .leading) {
                            Text("Power (Sph)")
                                .bold()
                            TextField(
                                "Right Eye Power",
                                text: $leftPower
                            )
                        }
                        VStack(alignment: .leading) {
                            Text("Cylinder (Cyl)")
                                .bold()
                            TextField(
                                "Right Eye Cylinder",
                                text: $leftCyl
                            )
                        }
                        
                       
                        VStack(alignment: .leading) {
                            Text("Axis")
                                .bold()
                            TextField(
                                "Right Eye Axis",
                                text: $leftAxis
                            )
                        }
                        
                        
                        VStack(alignment: .leading) {
                            Text("Addition (Add)")
                                .bold()
                            TextField(
                                "Right Eye Add",
                                text: $leftAdd
                            )
                        }

                    }
                    
                    if !showRight {
                        VStack(alignment: .leading) {
                            Text("Power (Sph)")
                                .bold()
                            TextField(
                                "Right Eye Power",
                                text: $rightPower
                            )
                        }
                        VStack(alignment: .leading) {
                            Text("Cylinder (Cyl)")
                                .bold()
                            TextField(
                                "Right Eye Cylinder",
                                text: $rightCyl
                            )
                        }
                        
                       
                        VStack(alignment: .leading) {
                            Text("Axis")
                                .bold()
                            TextField(
                                "Right Eye Axis",
                                text: $rightAxis
                            )
                        }
                        
                        
                        VStack(alignment: .leading) {
                            Text("Addition (Add)")
                                .bold()
                            TextField(
                                "Right Eye Add",
                                text: $rightAdd
                            )
                        }

                    }
                    
                    
                   // Text("Two")
                    //Text("Three")
                } header: {
                    Text("RIGHT EYE (OD)")
                }
                
                
            }
            .navigationTitle("Prescription")
            // This is the only difference.
            .listStyle(.insetGrouped)
        }
    }
}

