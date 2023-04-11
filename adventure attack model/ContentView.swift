//
//  ContentView.swift
//  adventure attack model
//
//  Created by Brody Dickson on 4/10/23.
//


// Owen wuz here

import SwiftUI

struct ContentView: View {
    @State var PlayerHealth = 25
    @State var MonsterBlueHP = 10
    @State var monsterescape = 0
    @State var PlayerEscape = 0
    @State var PlayerDamage = 2
    @State var ReactionText = ""
    @State var CanChange = true
    var body: some View {
        VStack {
            Text("Your health: \(PlayerHealth)")
            Text("a monster with bright blue teeth and a iguana shaped body but mich larger aproaches you what do you do?")
            
            Button("attack"){
                if CanChange == true {
                    ReactionText = "You attack the monster with your fists, the moster comes back ready to pounce at you"
                    MonsterBlueHP -= PlayerDamage
                    
                }
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
                            
                            PlayerHealth -= 4
                        }
                    }
                }
                
        
            Text(ReactionText)
            HStack{
                Text(String(PlayerHealth))
                Text(String(MonsterBlueHP))
            
                
            }
        }
        .padding()
    }
    func AttackInterface {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

