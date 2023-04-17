//
//  AttackView.swift
//  adventure attack model
//
//  Created by Brody Dickson on 4/11/23.
//

import SwiftUI

struct AttackView: View {
    let engagedMonster : String
    var playerHealth : Int
    var storyIndex : Int
    // monster vars
    @State var monsterHealth = 100
    @State var MonsterDmgMax = 10
    //opacity
    @State var PlayerHealth = 100
    @State var ReadyOpac = 1.0
    @State var FightOpac = 0.0
    @State var PlayerMana = 50
    @State var Playerdmg = 0
    @State var monsterDmg = 0
    @State var Attackline = ""
    @State var Reaction = ""
    @State var GameOver = 0.0
    @State var MonsterDead = 0.0
    @State var RandomItemSelect = 0
    @State var itemEarned = ""
    @State var itemArray = ["Knife (+3 melee)", "Sword (+4 melee)", "Super cool wand (+2 magic)", "cool glowing orb(+2 magical damage)"]
    @State var monsterAttackquotes = ["The moster looks at you and pounces to bite you and does", "The monster charges and headbutts you"]
    var body: some View {
        NavigationView {
            ZStack {
                VStack{
                HStack {
                    
                    Text("your health is:" + String(PlayerHealth))
                    Text("The Monsters health is:" + String(monsterHealth))
                    Text("Your current mana is " + String(PlayerMana))
                } .opacity(FightOpac)
                Button("Ready Yourself"){
                    if engagedMonster == "BlackRat" {
                        monsterHealth = 10
                        MonsterDmgMax = 5
                        PlayerHealth = playerHealth
                        FightOpac = 1.0
                        ReadyOpac = 0.0
                    }
                }
                .opacity(ReadyOpac)
                NavigationLink("continue", destination: ContentView(storyIndex: storyIndex))
                    .opacity(MonsterDead)
                
                Text(Attackline)
                Text(Reaction)
                HStack{
                    Button("use your fists to attack the rat"){
                        Playerdmg = Int.random(in: 1..<2)
                        monsterHealth -= Playerdmg
                        if monsterHealth <= 0 {
                            CheckMonsterHealth()
                        } else {
                            monsterDmg = Int.random(in: 1..<MonsterDmgMax)
                            PlayerHealth -= monsterDmg
                            Reaction = "The monster did \(String(monsterDmg))"
                            Attackline = "You did \(Playerdmg) damage, to the monster"
                            CheckPlayerHealth()
                            
                            
                        }
                    }
                    .opacity(FightOpac)
                    Button("cast fireball 10 mana "){
                        if PlayerMana >= 10{
                            Playerdmg = Int.random(in: 1..<4)
                            monsterHealth -= Playerdmg
                            PlayerMana -= 10
                            if monsterHealth <= 0 {
                                CheckMonsterHealth()
                            } else {
                                
                                monsterDmg = Int.random(in: 1..<MonsterDmgMax)
                                PlayerHealth -= monsterDmg
                                Reaction = "The monster did \(String(monsterDmg))"
                                Attackline = "You did \(Playerdmg) damage, to the monster"
                                CheckPlayerHealth()
                            }
                        } else {
                            Attackline = "You dont have enough mana"
                        }
                    }
                    .opacity(FightOpac)
                    Button("cast lightining strike 20 mana"){
                        if PlayerMana >= 20 {
                            Playerdmg = Int.random(in: 1..<5)
                            monsterHealth -= Playerdmg
                            PlayerMana -= 20
                            if monsterHealth <= 0 {
                                CheckMonsterHealth()
                            } else {
                                monsterDmg = Int.random(in: 1..<MonsterDmgMax)
                                PlayerHealth -= monsterDmg
                                Reaction = "The monster did \(String(monsterDmg))"
                                Attackline = "You did \(Playerdmg) damage, to the monster"
                                CheckPlayerHealth()
                            }
                        } else {
                            Attackline = "You dont have enough mana"
                        }
                    }
                    .opacity(FightOpac)
                    
                }
            }
               
        }
            .background(
                    Image("background")
                        .scaledToFit()
                )
        }
        .navigationBarBackButtonHidden(true)
    }
    func CheckPlayerHealth() {
        if PlayerHealth <= 0 {
            Attackline = "YOU HAVE DIED"
            
        }
    }
    func CheckMonsterHealth() {
        RandomItemSelect = Int.random(in: 0..<4)
        if monsterHealth <= 0 {
            
            Attackline = "You killed the monster you get \(itemEarned)"
            
            itemEarned = itemArray[RandomItemSelect]
            MonsterDead = 1.0
            FightOpac = 0.0
            
            
            
        }
    }
    func RandomMonsterQuote() {
        
    }
}

struct AttackView_Previews: PreviewProvider {
    static var previews: some View {
        AttackView(engagedMonster: "yo6", playerHealth: 20, storyIndex: 3)
    }
}

struct blackRat: Codable {
    var health = 10
    var dmgmax = 5
    var Attack1 = "The Rat clawed you for"
    var Attack2 = "The Rat bites you for"
}




