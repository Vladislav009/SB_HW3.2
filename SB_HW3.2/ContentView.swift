//
//  ContentView.swift
//  SB_HW3.2
//
//  Created by Vladislav Kulak on 24.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    var body: some View {
        
        VStack{
            Color(red: redSliderValue/255, green: greenSliderValue/255, blue: blueSliderValue/255)
                .frame(height: 200)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white, lineWidth: 5)
                )
                .padding(.bottom, 30)
            
            ColorSliderView(color: .red, value: $redSliderValue)
            ColorSliderView(color: .green, value: $greenSliderValue)
            ColorSliderView(color: .blue, value: $blueSliderValue)
            
            Spacer()
        }
        .padding()
        .background(.cyan)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSliderView: View {
    
    let color: Color
    
    @Binding var value: Double
    
    var body: some View {
        
        HStack {
            Text("\(lround(value))")
                .foregroundColor(color)
                .frame(width: 35, alignment: .leading)
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(color)
                .padding(.trailing, 40)
            TextField("", text: $value.str)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)
                .frame(width: 50)
        }
    }
}

extension Double {
     var str: String {
         get { String(lround(self)) }
         set { self = Double(newValue) ?? 0.0}
     }
 }

