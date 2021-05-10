//
//  HomeScreen.swift
//  BrotherApp
//
//  Created by Dianne Camarillo on 3/26/21.
//

import SwiftUI

struct HomeScreen: View {
    
    var body: some View {
        VStack {
            Spacer()
            Image("brother-logo")
                .resizable()
                .scaledToFit()
                .padding()
            Spacer()
            Spacer()
            Text("Wanna hear a joke?")
            Text("Why did the programmer quit his job? Because he didn't get arrays.")
                .padding(.trailing)
                .padding(.leading)
            Button(action: {}, label : {
            Image("coin")
                .resizable()
                .padding()
                .frame(minWidth: 10, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: 20, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 10, maxHeight: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                func coinFlip() -> String {
                    let coin = ["Heads", "Tails"]
                    let flip = coin.randomElement()
                    return flip
                }
                Text("You got: \(flip)")
            })
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

/*
var jokes = [
 
]
*/
