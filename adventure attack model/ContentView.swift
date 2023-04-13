//
//  ContentView.swift
//  adventure attack model
//
//  Created by Brody Dickson on 4/10/23.
//


// Owen wuz here

import SwiftUI

struct ContentView: View {
    @State var MonsterBlueHP = 10
    @State var monsterescape = 0
    @State var PlayerEscape = 0
    @State var PlayerDamage = 2
    @State var ReactionText = ""
    @State var engagedMonster = ""
    @State var storyText = 0
    @State var CanChange = true
    @State var playerHealth = 25
    var body: some View {
        NavigationView{
            VStack {
                Text("Your health: \(playerHealth)")
                
                
                NavigationLink("Attack", destination: AttackView(engagedMoster: engagedMonster))
                    .onTapGesture {
                        engagedMonster = "BlackRat"
                    }
                        
                Button("Run"){
                    if CanChange == true {
                        PlayerEscape = Int.random(in: 1..<7)
                        monsterescape = Int.random(in: 1..<7)
                        if PlayerEscape > monsterescape {
                            ReactionText = "you succesfully ran away without a scratch"
                            
                            MonsterBlueHP = 0
                            
                            
                        } else {
                            ReactionText = "The monster caught as you were trying to sneak away you take 4 damage"
                            
                            NavigationLink("Attack", destination: AttackView(engagedMoster: engagedMonster, playerHealth: playerHealth))
                            

                            
                        }
                    }
                }
                
                
                Text(ReactionText)
                HStack{
                    Text(String(playerHealth))
                    Text(String(MonsterBlueHP))
                    
                    
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}







