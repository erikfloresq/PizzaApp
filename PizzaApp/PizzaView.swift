//
//  PizzaView.swift
//  PizzaApp
//
//  Created by Erik Flores on 19/01/21.
//

import SwiftUI

struct PizzaView: View {
    @State var with: CGFloat = 200
    @State var height: CGFloat = 200
    @State var degress: Double = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Image("pizza")
                .resizable()
                .frame(width: with, height: height)
                .rotationEffect(Angle(degrees: degress))
            HStack(spacing: 10) {
                ButtonSize(width: $with,
                           height: $height,
                           degress: $degress,
                           size: .s)
                ButtonSize(width: $with,
                           height: $height,
                           degress: $degress,
                           size: .m)
                ButtonSize(width: $with,
                           height: $height,
                           degress: $degress,
                           size: .l)
            }
        }
    }
}

struct ButtonSize: View {
    enum Size {
        case s, m, l
    }
    
    @Binding var width: CGFloat
    @Binding var height: CGFloat
    @Binding var degress: Double
    let size: Size
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                setValues()
            }
        }, label: {
            Text(getValueButton())
        })
    }
    
    func setValues() {
        switch size {
        case .s:
            width = 200
            height = 200
            degress = 0
        case .m:
            width = 250
            height = 250
            degress = 180
        case .l:
            width = 300
            height = 300
            degress = 360
        }
    }
    
    func getValueButton() -> String {
        switch size {
        case .s:
            return "S"
        case .m:
            return "M"
        case .l:
            return "L"
        }
    }
}

struct PizzaView_Previews: PreviewProvider {
    static var previews: some View {
        PizzaView()
    }
}
