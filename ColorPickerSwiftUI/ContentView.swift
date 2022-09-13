//
//  ContentView.swift
//  ColorPickerSwiftUI
//
//  Created by Ilya Kozhevnikov on 13.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State var redAmount = Double.random(in: 0...255)
    @State var greenAmount = Double.random(in: 0...255)
    @State var blueAmount = Double.random(in: 0...255)
    
    var body: some View {
        VStack {
            Color(
                red: redAmount / 255,
                green: greenAmount / 255,
                blue: blueAmount / 255
            )
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .frame(height: 150)
            
            ColorSelectionStack(
                color: .red,
                amount: $redAmount)
            
            ColorSelectionStack(
                color: .green,
                amount: $greenAmount)
            
            ColorSelectionStack(
                color: .blue,
                amount: $blueAmount)
            
            Spacer()
        }
        .padding()
    }
}

struct ColorSelectionStack: View {
    let color: Color
    @Binding var amount: Double
    @State private var textAmount = ""
    
    var body: some View {
        HStack {
            Text("\(lround(amount))")
                .frame(width: 35, alignment: .trailing)
                .foregroundColor(color)
            
            Slider(value: $amount, in: 0...255)
                .accentColor(color)
                .padding(.trailing, 8.0)
                .onChange(of: amount) { _ in
                    textAmount = "\(lround(amount))"
                }
            
            TextField("\(lround(amount))", text: $textAmount)
                .onChange(of: textAmount) { _ in
                    guard let newAmount = Double(textAmount) else {
                        textAmount = ""
                        return
                    }
                    
                    if newAmount > 255 {
                        amount = 255
                    } else if newAmount < 0 {
                        amount = 0
                    } else {
                        amount = newAmount
                    }
                    
                    textAmount = "\(lround(amount))"
                }
                .frame(width: 50, alignment: .leading)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)

        }
    }
    
    private func textFieldChange() {
        amount = Double(textAmount) ?? 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
