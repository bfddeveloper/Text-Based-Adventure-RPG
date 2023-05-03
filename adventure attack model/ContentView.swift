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
    var itemEarned : String
    var AttackHealth : Int
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
    @State var RunOpac = 0.0
    @State var HealthOpac = 1.0
    //timer
   
    //Story Arrays
    @State var StoryArray = ["You are stranded inside a cave on the ground with nothing but a wand and some food","You continue forward through the cave ", "A black rat is standing infront of you about to attack! What do you do?", "You continue towards the light", "You see the end of the cave infront of you not but 20 feet, there is the bright green wilderness with trees, flowers, and trees bearing fruit.","There is a piece of fruit on the ground that looks nourishing.", " All of a sudden you hear deep rumbling coming from above you.", "Suddenly, a giant mole sprouts from the ground with a stance ready to attack.", "After yet another perilous battle, you run out of the cave to make sure you are not met with any more foes.", "As you exit the cave you see the landscape of an abandoned and run down city.", "This is the first time ive been above ground in months, maybe even years! How long was I in there?"]
    @State var LookDescArray = [ "There is walls made of old crumbling stone, infront of you, you can see a faint dot of light which appears to be the entrance to the cave. Behind you there is nothing but a stone wall", " there is still just a cave light infront of you it looks closer"]
    @State var StorySideArray = [""]
    @State var descIndex = 0
    
    
    var body: some View {
        NavigationView{
            ZStack {
                Color.mint
                    .ignoresSafeArea()
                VStack {
                    HealthBar(health: CGFloat(playerHealth))
                    Text(itemEarned)
                    Text("Your health: \(playerHealth)")
                        .opacity(HealthOpac)
                    Text(storytext)
                        .frame(minWidth: 150, maxWidth: 300, minHeight: 50, maxHeight: 100)
                        .multilineTextAlignment(.center)
                        .position(x: 193, y: 200)
                    
                    Button("Continue"){
                        storytext = StoryArray[storyIndex]
                        storyIndex += 1
                        playerHealth = AttackHealth
                        if storyIndex == 1 {
                            lookOpac = 1.0
                            continueOpac = 1.0
                        }
                        if storyIndex == 3 {
                            lookOpac = 0.0
                            attackInitiation = 1.0
                            RunOpac = 1.0
                            continueOpac = 0.0
                            engagedMonster = "BlackRat"
                            HealthOpac = 0.0
                        }
                        if storyIndex == 4 {
                            HealthOpac = 1.0
                        }
                        if storyIndex == 8{
                            lookOpac = 0.0
                            attackInitiation = 1.0
                            RunOpac = 1.0
                            continueOpac = 0.0
                            engagedMonster = "Mole"
                            HealthOpac = 0.0
                        }
                    }
                    .opacity(continueOpac)
                    .buttonStyle(CustomButtonStyle())
                    .position(x: 197, y: 120)
                    Button("look around"){
                        storytext = LookDescArray[descIndex]
                        descIndex += 1
                        continueOpac = 1.0
                        lookOpac = 0.0
                    }
                    .position(x: 197, y: 51)
                    .opacity(lookOpac)
                    .buttonStyle(CustomButtonStyle())
                    //atck stuff
                    HStack {
                        NavigationLink("Attack", destination: AttackView(engagedMonster: engagedMonster, playerHealth: playerHealth, storyIndex: storyIndex))
                            .opacity(attackInitiation)
                            .buttonStyle(CustomButtonStyle())
                        Button("Run"){
                            if CanChange == true {
                                PlayerEscape = Int.random(in: 1..<3)
                                monsterescape = Int.random(in: 1..<9)
                                if PlayerEscape > monsterescape {
                                    storytext = "You succesfully ran away without a scratch"
                                    continueOpac = 1.0
                                    RunOpac = 0.0
                                    attackInitiation = 0.0
                                } else {
                                    storytext = "The monster caught as you were trying to sneak away! You take 4 damage. You have no other choice but to attack."
                                    attackInitiation = 1.0
                                    RunOpac = 0.0
                                    //NavigationLink("HI",destination: AttackView(engagedMonster: engagedMonster, //playerHealth: playerHealth, storyIndex: storyIndex))
                                    playerHealth -= 4
                                }
                            }
                        }
                        .buttonStyle(CustomButtonStyle())
                        .opacity(RunOpac)
                    }
                    .position(x: 200, y: -200)
                    //end
                    
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Story")
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(itemEarned: "something", AttackHealth: 20)
    }
}

struct Story {
    var Main1 = "You are stranded inside a cave on the ground with nothing but a wand and some food"
    var sceneOneDesc = "There are walls made of old crumbling stone, infront of you, you can see a faint dot of light which appears to be the entrance to the cave. Behind you there is nothing but a stone wall"
}

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 100, height: 50)
            .font(Font.custom("Marker Felt", size: 16))
            .padding()
            .background(.red).opacity(configuration.isPressed ? 0.0 : 1.0)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}








