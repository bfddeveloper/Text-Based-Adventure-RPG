//
//  ContentView.swift
//  adventure attack model
//
//  Created by Brody Dickson on 4/10/23.
//


// Owen wuz here

import SwiftUI

struct ContentView: View {
    let story = Story()
    @State var MonsterBlueHP = 10
    @State var monsterescape = 0
    @State var PlayerEscape = 0
    @State var PlayerDamage = 2
    @State var ReactionText = ""
    @State var engagedMonster = ""
    @State var storyText = ""
    @State var storytext = ""
    @State var CanChange = true
    @State var playerHealth = 25
    @State var storyIndex = 0
    //opacity
    @State var lookOpac = 0.0
    @State var continueOpac = 1.0
    @State var attackInitiation = 0.0
    //Story Arrays
    @State var StoryArray = ["You are stranded inside a cave on the ground with nothing but a wand and some food","You Coninue forward through the cave ", "A black rat is standing infront of you ready to attack you what do you do"]
    @State var LookDescArray = [ "There is walls made of old crumbling stone, infront of you, you can see a faint dot of light which appears to be the entrance to the cave. Behind you there is nothing a stone wall", " there is still just a cave light infront of you it looks closer"]
    @State var descIndex = 0
    
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Your health: \(playerHealth)")
                Text(storytext)
                //
                Button("Continue"){
                    storytext = StoryArray[storyIndex]
                    storyIndex += 1
                    if storyIndex == 1 {
                        lookOpac = 1.0
                        continueOpac = 0.0
                    }
                    if storyIndex == 2 {
                        attackInitiation = 1.0
                        continueOpac = 0.0
                    }
                }
                .opacity(continueOpac)
                
                Button("look around"){
                    storytext = LookDescArray[descIndex]
                    descIndex += 1
                    continueOpac = 1.0
                    lookOpac = 0.0
                }
                .opacity(lookOpac)
                
                //atck stuff
                
                HStack {
                    NavigationLink("Attack", destination: AttackView(engagedMonster: engagedMonster, playerHealth: playerHealth))
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
                                playerHealth -= 4
                                
                                
                                
                            }
                        }
                    }
                }
                .opacity(attackInitiation)
                //end
                
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

struct Story {
    var Main1 = "You are stranded inside a cave on the ground with nothing but a wand and some food"
    
    var sceneOneDesc = "There is walls made of old crumbling stone, infront of you, you can see a faint dot of light which appears to be the entrance to the cave. Behind you there is nothing a stone wall"
    
}








