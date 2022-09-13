//
//  ContentView.swift
//  ColorPickerSwiftUI
//
//  Created by Ilya Kozhevnikov on 13.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State var redAmount = 240.0
    @State var greenAmount = 80.0
    @State var blueAmount = 160.0
    
    var body: some View {
        VStack {
            Color(
                red: redAmount / 255,
                green: greenAmount / 255,
                blue: blueAmount / 255
            )
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .frame(height: 200)
            
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
    
    var body: some View {
        HStack {
            Text("\(lround(amount))")
                .frame(width: 35, alignment: .trailing)
                .foregroundColor(color)
            
            Slider(value: $amount, in: 0...255)
                .accentColor(color)
                .padding(.trailing, 8.0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
