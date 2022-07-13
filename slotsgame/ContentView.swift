//
//  ContentView.swift
//  slotsgame
//
//  Created by Logan Kells on 7/13/22.
//

import SwiftUI



struct ContentView: View {
    // Credit state management
    @State private var credits: Int = 1_000
    private let points: Int = 5
    @State private var direction: Int = 1
    
    // Icon state management
    @State private var icon1: String = "apple"
    @State private var icon2: String = "apple"
    @State private var icon3: String = "apple"
    private var icons = [0: "apple",
                         1: "star",
                         2: "cherry"]

    var body: some View {
        VStack(spacing: 20.0) {
            Spacer()
            
            Text("SwiftUI Slots!")
                .font(.largeTitle)
                .padding(.top, 25.0)
            
            Spacer()
            
            Text("Credits: " + String(credits))
            
            Spacer()
            
            HStack {
                // TODO - dynamic images
                Spacer()
                
                Image(icon1)
                    .resizable()
                    .scaledToFit()
                
                Spacer()
                
                Image(icon2)
                    .resizable()
                    .scaledToFit()
                
                Spacer()
                
                Image(icon3)
                    .resizable()
                    .scaledToFit()
                
                Spacer()

            }
            
            Spacer()
            
            Button {
                // Get new icons
                icon1 = String(icons[Int.random(in: 1...3)] ?? "apple")
                icon2 = String(icons[Int.random(in: 1...3)] ?? "apple")
                icon3 = String(icons[Int.random(in: 1...3)] ?? "apple")
                
                // Only add points if every symbol matches
                if icon1 == icon2 && icon2 == icon3 {
                    direction = 6
                } else {
                    direction = -1
                }
                
                credits = credits + (direction * points)
                
                
            } label: {
                Text("Spin")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.all, 35.0)
                    .frame(height: 35.0)
                    .background(Color.red)
                    .cornerRadius(20.0)
            }

            
            
                
            
            Spacer()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
