//
//  ContentView.swift
//  LuckyThree
//
//  Created by Anibal Ventura on 12/30/20.
//

import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContentView: View {
    
    // MARK: - Properties
    @State private var credits = 1000
    @State private var slot1 = 1
    @State private var slot2 = 2
    @State private var slot3 = 3
    
    // MARK: - View
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text("Lucky Three!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding()
                    .foregroundColor(.white)
                Spacer()
                
                Text("Credits: \(credits)")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .padding()
                    .foregroundColor(.white)
                Spacer()
                
                HStack {
                    Spacer()
                    Image("fruit\(slot1)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Image("fruit\(slot2)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Image("fruit\(slot3)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                }
                Spacer()
                
                Button(action: {
                    spinButton()
                }, label: {
                    Text("Spin")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                })
                .frame(width: 120.0, height: 40.0)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                .cornerRadius(30)
                Spacer()
            }
        }
        .background(Color.gray)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
    
    // MARK: - Methods
    
    private func spinButton() {
        // Generate random slots
        let slot1Rand = Int.random(in: 1...3)
        let slot2Rand = Int.random(in: 1...3)
        let slot3Rand = Int.random(in: 1...3)
        
        // Change fruits
        slot1 = slot1Rand
        slot2 = slot2Rand
        slot3 = slot3Rand
        
        updateCredits()
    }
    
    private func updateCredits() {
        if slot1 == slot2 && slot2 == slot3 {
            credits += 15
        } else {
            credits -= 5
        }
    }
}
