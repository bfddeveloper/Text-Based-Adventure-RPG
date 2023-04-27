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
    @State var AttackHealth = 8
    @State var itemArray = ["Knife (+3 melee)", "Sword (+4 melee)", "Super cool wand (+2 magic)", "cool glowing orb(+2 magical damage)"]
    @State var monsterAttackquotes = ["The moster looks at you and pounces to bite you and does", "The monster charges and headbutts you", "The monster whips it claw at you and scratches you"]
    @State var MQoute = ""
    var body: some View {
        NavigationView {
            ZStack {
                Color.mint
                    .ignoresSafeArea()
                VStack{
                    HealthBar(health: CGFloat(playerHealth))
                    HStack {
                        Text("your health is:" + String(AttackHealth))
                        Text("The Monsters health is:" + String(monsterHealth))
                        Text("Your current mana is " + String(PlayerMana))
                    } .opacity(FightOpac)
                    Button("Ready Yourself"){
                        if engagedMonster == "BlackRat" {
                            monsterHealth = 10
                            MonsterDmgMax = 5
                            AttackHealth = playerHealth
                            FightOpac = 1.0
                            ReadyOpac = 0.0
                        } else if engagedMonster == "MonsterLizard" {
                            monsterHealth = 20
                            MonsterDmgMax = 5
                            PlayerHealth = playerHealth
                            FightOpac = 1.0
                            ReadyOpac = 0.0
                        }
                    }
                    .opacity(ReadyOpac)
                    .buttonStyle(CustomButtonStyle())
                    NavigationLink("continue", destination: ContentView(itemEarned: itemEarned, AttackHealth: AttackHealth, storyIndex: storyIndex))
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
                                MQoute = monsterAttackquotes[Int.random(in: 1..<monsterAttackquotes.count)]
                                AttackHealth -= monsterDmg
                                Reaction = "\(MQoute) and did \(String(monsterDmg)) damage"
                                Attackline = "You did \(Playerdmg) damage, to the monster"
                                CheckPlayerHealth()
                            }
                        }
                        .opacity(FightOpac)
                        .buttonStyle(CustomButtonStyle())
                        Button("cast fireball 10 mana "){
                            if PlayerMana >= 10{
                                Playerdmg = Int.random(in: 1..<4)
                                monsterHealth -= Playerdmg
                                PlayerMana -= 10
                                if monsterHealth <= 0 {
                                    CheckMonsterHealth()
                                } else {
                                    
                                    monsterDmg = Int.random(in: 1..<MonsterDmgMax)
                                    AttackHealth -= monsterDmg
                                    Reaction = "\(MQoute) and did \(String(monsterDmg)) damage"
                                    Attackline = "You did \(Playerdmg) damage, to the monster"
                                    CheckPlayerHealth()
                                }
                            } else {
                                Attackline = "You dont have enough mana"
                            }
                        }
                        .buttonStyle(CustomButtonStyle())
                        .opacity(FightOpac)
                        Button("cast lightining strike 20 mana"){
                            if PlayerMana >= 20 {
                                Playerdmg = Int.random(in: 1..<5)
                                monsterHealth -= Playerdmg
                                PlayerMana -= 20
                                if monsterHealth <= 0 {
                                    CheckMonsterHealth()
                                } else {
                                    Reaction = "\(MQoute) and did \(String(monsterDmg)) damage"
                                    AttackHealth -= monsterDmg
                                    Reaction = "The monster did \(String(monsterDmg))"
                                    Attackline = "You did \(Playerdmg) damage, to the monster"
                                    CheckPlayerHealth()
                                }
                            } else {
                                Attackline = "You dont have enough mana"
                            }
                        }
                        .buttonStyle(CustomButtonStyle())
                        .opacity(FightOpac)
                        
                    }
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    func CheckPlayerHealth() {
        if AttackHealth <= 0 {
            Attackline = "YOU HAVE DIED"
            
        }
    }
    func CheckMonsterHealth() {
        RandomItemSelect = Int.random(in: 0..<4)
        if monsterHealth <= 0 {
            itemEarned = itemArray[RandomItemSelect]
            Attackline = "You killed the monster you get \(itemEarned)"
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






