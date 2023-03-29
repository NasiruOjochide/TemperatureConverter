//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by Danjuma Nasiru on 26/12/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var fromTemp = ""
    @State private var toTemp = ""
    @State private var tempValue = 0.0
    
    var symbol : String {
        if fromTemp == "Celcius"{
            return "℃"
        }else if fromTemp == "Fahrenheit"{
            return "℉"
        }else{
            return "K"
        }
    }
    
    
    
    var temps = ["Celcius", "Fahrenheit", "Kelvin"]
    var convertedValue : String{
        if fromTemp == "Celcius" && toTemp == "Fahrenheit"{
            return "\((tempValue * 1.8) + 32)℉"
        } else if fromTemp == "Fahrenheit" && toTemp == "Celcius"{
            return "\((tempValue - 32) / 1.8)℃"
        } else if fromTemp == "Celcius" && toTemp == "Kelvin"{
            return "\(tempValue + 273.15)K"
        } else if fromTemp == "Kelvin" && toTemp == "Celcius"{
            return "\(tempValue - 273.15)℃"
        } else if fromTemp == "Fahrenheit" && toTemp == "Kelvin"{
            return "\(((tempValue - 32) / 1.8) + 273.15)K"
        } else if fromTemp == "Kelvin" && toTemp == "Fahrenheit"{
            return "\(((tempValue - 273.15) * 1.8) + 32)℉"
        }else{
            return ""
        }
    }
    
    var body: some View {
        Form{
            Section{
                Picker("ConvertFrom:", selection: $fromTemp, content: {
                    ForEach(temps, id: \.self, content: {
                        Text($0)
                    })
                }).pickerStyle(.segmented)
            } header: {
                Text("choose temperature unit to convert from")
            }
            
            Section{
                Picker("ConvertTo:", selection: $toTemp, content: {
                    ForEach(temps, id: \.self, content: {
                        Text($0)
                    })
                }).pickerStyle(.segmented)
            } header: {
                Text("choose temperature unit to convert to")
            }
            
            //TextField("Enter Temperature Value", value: $tempValue, formatter: )
            
            Text(convertedValue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
