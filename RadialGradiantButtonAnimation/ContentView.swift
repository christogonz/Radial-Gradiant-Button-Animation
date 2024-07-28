//
//  ContentView.swift
//  RadialGradiantButtonAnimation
//
//  Created by Christopher Gonzalez on 2024-07-28.
//

import SwiftUI

struct ContentView: View {
    @State var appear = false
    
    var body: some View {
        VStack {
            CustomButton(
                text: "Sign In",
                icon: "apple.logo"
            )
            
            CustomButton(
                text: "Profile",
                icon: "person.circle.fill",
                gradient: [Color.black, Color("myBlue")],
                width: 130,
                heigth: 120
            )
            
        }
    }
}

#Preview {
    ContentView()
}
