//
//  Energy Compariosn.swift
//  Energy Planner
//
//  Created by Aathithya Jegatheesan on 4/2/23.
//

import SwiftUI

struct EnergyProvider: Identifiable {
    let id = UUID()
    let name: String
    let rate: Double
    let term: String
}

struct EnergyCompare: View {
    @State private var monthlyUsage = ""
    @State private var selectedProvider = 0
    let providers = [EnergyProvider(name: "Provider 1", rate: 0.13, term: "12 months"),
                     EnergyProvider(name: "Provider 2", rate: 0.15, term: "24 months"),
                     EnergyProvider(name: "Provider 3", rate: 0.12, term: "36 months")]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Monthly Usage")) {
                    TextField("Enter your monthly usage in kWh", text: $monthlyUsage)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Providers")) {
                    ForEach(providers) { provider in
                        HStack {
                            Text("\(provider.name)")
                            Spacer()
                            Text("$\(String(format: "%.2f", calculateBill(for: provider)))")
                                .foregroundColor(calculateBill(for: provider) == lowestBill() ? .green : .gray)
                        }
                    }
                }
                
                Section(header: Text("Lowest Bill")) {
                    Text("\(providers[selectedProvider].name) with a monthly rate of $\(String(format: "%.2f", lowestBill()))")
                        .foregroundColor(.green)
                }
            }
            .navigationBarTitle("Energy Provider Comparer")
        }
    }
    
    func calculateBill(for provider: EnergyProvider) -> Double {
        let usage = Double(monthlyUsage) ?? 0
        return usage * provider.rate
    }
    
    func lowestBill() -> Double {
        let bills = providers.map { calculateBill(for: $0) }
        let minBill = bills.min()
        selectedProvider = bills.firstIndex(of: minBill!)!
        return minBill!
    }
}


struct EnergyCompare_Previews: PreviewProvider {
    static var previews: some View {
        EnergyCompare()
    }
}
