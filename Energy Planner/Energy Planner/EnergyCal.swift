//
//  EnergyCal.swift
//  Energy Planner
//
//  Created by Aathithya Jegatheesan on 4/2/23.
//

import SwiftUI

struct EnergyCal: View {
    @State private var area: String = ""
    @State private var electricityUsage: String = ""
    @State private var panelOptions = ["Option 1", "Option 2", "Option 3"]
    @State private var selectedOption = 0
    @State private var panelOutput = 0.15
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Area")) {
                    TextField("Enter the area in square meters", text: $area)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Electricity Usage")) {
                    TextField("Enter your daily electricity usage in kWh", text: $electricityUsage)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Panel Options")) {
                    Picker("Select an option", selection: $selectedOption) {
                        ForEach(0..<panelOptions.count) {
                            Text(self.panelOptions[$0])
                        }
                    }
                }
                
                Section(header: Text("Calculations")) {
                    Text("Number of panels needed: \(calculatePanelsNeeded(), specifier: "%.0f")")
                }
            }
            .navigationBarTitle("Solar Calculator")
        }
    }
    
    func calculatePanelsNeeded() -> Double {
        let usage = Double(electricityUsage) ?? 0
        return usage / panelOutput
    }
}



struct EnergyCal_Previews: PreviewProvider {
    static var previews: some View {
        EnergyCal()
    }
}
