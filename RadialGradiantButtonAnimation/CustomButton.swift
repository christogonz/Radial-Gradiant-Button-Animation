//
//  CustomButton.swift
//  RadialGradiantButtonAnimation
//
//  Created by Christopher Gonzalez on 2024-07-28.
//

import SwiftUI

struct CustomButton: View {
    var text: String = "Text Here"
    var icon: String? = "person"
    var gradient: Array<Color> = [Color("myGray"), Color.black]
    var width: Double = .infinity
    var heigth: Double = 50
    
    @State var appear = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .frame(width: width, height: heigth)
            .foregroundStyle(.linearGradient(colors: gradient, startPoint: .topLeading, endPoint: .bottomTrailing)
                .shadow(.inner(color: .white.opacity(0.2), radius: 0, x: 1, y: 1))
                .shadow(.inner(color: .white.opacity(0.05), radius: 4, x: 0, y:-4))
                .shadow(.drop(color: .black.opacity(0.5), radius: 30, y: 30))
            )
            .overlay(RoundedRectangle(cornerRadius: 30).stroke(.black, lineWidth: 1))
//            .overlay(Image(systemName: "circle").foregroundStyle(.white))
            .overlay(HStack {
                Image(systemName: icon ?? "")
                Text(text)
            }).fontWeight(.semibold)
            .foregroundStyle(.linearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
            .background(
                ZStack {
                    AngularGradient(
                        colors: [.red, .blue, .teal, .red], center: .center,
                                    angle: .degrees(appear ? 360 : 0))
                        .clipShape(.rect(cornerRadius: 30))
                        .blur(radius: 10)
                    
                    AngularGradient(colors: [.white, .blue, .teal, .white], center: .center, angle: .degrees(appear ? 360 : 0))
                        .clipShape(.rect(cornerRadius: 30))
                        .blur(radius: 10)
                }
            )
            .onAppear {
                withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                    appear = true
                }
            }
            .padding(50)
    }
}

#Preview {
    CustomButton()
}
