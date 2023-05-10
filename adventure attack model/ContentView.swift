//
//  ContentView.swift
//  adventure attack model
//
//  Created by Brody Dickson on 4/10/23.
//


// Owen wuz here

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Color.mint
                    .ignoresSafeArea()
                VStack {
                    Text("The Snail")
                    NavigationLink("Start", destination: StartView(itemEarned: "", AttackHealth: 25))
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
}
