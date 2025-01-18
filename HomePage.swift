//
//  HomePage.swift
//  idk
//
//  Created by Alyssa King on 1/14/25.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        TabView {
            Tab("Timer", systemImage: "alarm.fill") {
                Time()
            }
          


            Tab("Browse", systemImage: "tray.2.fill") {
                Browse()
            }


            Tab("Profile", systemImage: "person.crop.circle.fill") {
               Profile()
            }
            
        }
    }
}

