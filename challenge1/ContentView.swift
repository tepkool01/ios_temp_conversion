//
//  ContentView.swift
//  challenge1
//
//  Created by Michael Young on 2/17/22.
//

import SwiftUI

struct ContentView: View {
    @State private var inUnit = "celsius"
    @State private var outUnit = "fahrenheit"
    @State private var amount = 0.0
    @FocusState private var isFocused: Bool
    
    let units = ["celsius", "fahrenheit", "kelvin"]
    
    var result: Double {
        // No conversion
        if inUnit == outUnit {
            return amount
        }
        // Celsius conversion
        if inUnit == "celsius" {
            if outUnit == "fahrenheit" {
                return amount * (9 / 5) + 32
            }
            return amount + 273.15
        }
        //
        if inUnit == "fahrenheit" {
            if outUnit == "celsius" {
                return (amount - 32) * 5/9
            }
            return (amount - 32.0) * (5 / 9) + 273.15
        }
        
        if inUnit == "kelvin" {
            if outUnit == "fahrenheit" {
                return (amount - 273.15) * 9/5 + 32
            }
            return amount - 273.15
        }
        return amount
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("In Unit", selection: $inUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("In Units")
                }
                Section {
                    Picker("Out Unit", selection: $outUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Out Units")
                }
                Section {
                    TextField("Amount to Convert", value: $amount, format: .number)
                        .focused($isFocused)
                } header: {
                    Text("Amount to Convert")
                }
                .keyboardType(.decimalPad)
                
                Section {
                    Text(String(result))
                } header: {
                    Text("RESULT")
                }
            }
            .navigationTitle("Challenge 1")
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button("Done") {
                        isFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
