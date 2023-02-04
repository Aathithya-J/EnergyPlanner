//
//  ContentView.swift
//  Energy Planner
//
//  Created by Aathithya Jegatheesan on 4/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            EnergyCompare()
                .tabItem {
                    Label("Energy Planner", systemImage: "calendar")
                }
            EnergyCal()
                .tabItem {
                    Label("Energy Calculator", systemImage: "apps.iphone")
                }
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
