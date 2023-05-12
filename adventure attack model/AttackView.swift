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
    //timer
    @State private var timeRemaining = 10
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Environment(\.scenePhase) var scenePhase
    @State private var isTimerActive = true
    
    //opacity
    @State var PlayerHealth = 100
    @State var ReadyOpac = 1.0
    @State var FightOpac = 0.0
    @State var DeadOpac = 0.0
    @State var PlayerMana = 50
    @State var Playerdmg = 0
    @State var PlayerdmgmagicBonus = 0
    @State var Playerdmgmeleebonus = 0
    @State var monsterDmg = 0
    @State var Attackline = ""
    @State var Reaction = ""
    @State var GameOver = 0.0
    @State var MonsterDead = 0.0
    @State var RandomItemSelect = 0
    @State var itemEarned = ""
    @State var AttackHealth = 25
    @State var itemArray = ["Knife (+3 melee)", "Sword (+4 melee)", "Super cool wand (+2 magic)", "cool glowing orb(+2 magical damage)"]
    @State var monsterAttackquotes = ["The monster looks at you and pounces to bite you!", "The monster charges and headbutts you", "The monster whips it claw at you and scratches you"]
    @State var MQoute = ""
    var body: some View {
        NavigationView {
            ZStack {
                Color.mint
                    .ignoresSafeArea()
                VStack{
                    Text("Monsters health:" + String(monsterHealth))
                        .offset(y: 25)
                        .padding()
                    ZStack{
                        Rectangle()
                            .fill(.gray)
                            .frame(width: 300, height: 275)
                            .padding()
                        Image(engagedMonster)
                            .resizable()
                            .frame(width: 250, height: 200)
                            .offset(x: 0, y: -10)
                            .opacity(FightOpac)
                        
                    }
                    HealthBar(health: CGFloat(playerHealth))
                    HStack {
                        Text("health:" + String(AttackHealth))
                            .padding()
                        Text("mana: " + String(PlayerMana))
                    } .opacity(1.0)
                        .frame(width: 450, height: 50)
                    Button("Ready Yourself"){
                        if engagedMonster == "BlackRat" {
                            monsterHealth = 10
                            MonsterDmgMax = 5
                            AttackHealth = 25
                            FightOpac = 1.0
                            ReadyOpac = 0.0
                        } else if engagedMonster == "Mole" {
                            monsterHealth = 20
                            MonsterDmgMax = 5
                            AttackHealth = 25
                            FightOpac = 1.0
                            ReadyOpac = 0.0
                        }
                        if itemEarned == "Knife (+3 melee)" {
                            Playerdmgmeleebonus = 3
                        } else if itemEarned == "Sword (+4 melee)" {
                            Playerdmgmeleebonus = 4
                        } else if itemEarned == "Super cool wand (+2 magic)" {
                            PlayerdmgmagicBonus = 2
                        } else if itemEarned == "cool glowing orb(+2 magical damage)" {
                            PlayerdmgmagicBonus = 2
                        }
                    }
                    .opacity(ReadyOpac)
                    .buttonStyle(CustomButtonStyle())
                    NavigationLink("continue", destination: StartView(itemEarned: itemEarned, AttackHealth: AttackHealth, StoryRestart: false, storyIndex: storyIndex))
                    .opacity(MonsterDead)
                    .buttonStyle(CustomButtonStyle2())
                    NavigationLink("You Died!", destination: DeathView())
                        .opacity(DeadOpac)
                        .buttonStyle(CustomButtonStyle2())
                    VStack {
                        Text(Attackline)
                            .padding()
                        Text(Reaction)
                    }
                    .navigationBarBackButtonHidden(true)
                    .frame(width: 350, height: 150)
                    .offset(y: -300)
                HStack{
                    Button("use your melee"){
                        Playerdmg = Int.random(in: 1..<2)  + Playerdmgmeleebonus
                        monsterHealth -= Playerdmg
                        if monsterHealth <= 0 {
                            CheckMonsterHealth()
                        } else {
                            monsterDmg = Int.random(in: 1..<MonsterDmgMax)
                            MQoute = monsterAttackquotes[Int.random(in: 1..<monsterAttackquotes.count)]
                            AttackHealth -= monsterDmg
                            Attackline = "You did \(Playerdmg) damage, to the monster"
                            CheckPlayerHealth()
                            
                            Reaction = "\(MQoute) and did \(String(monsterDmg)) damage"
                            
                            
                        }
                    }
                    .opacity(FightOpac)
                    .buttonStyle(CustomButtonStyle2())
                    Button("fireball -10 M"){
                        if PlayerMana >= 10{
                            Playerdmg = Int.random(in: 1..<4) + PlayerdmgmagicBonus
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
                    .buttonStyle(CustomButtonStyle2())
                    .opacity(FightOpac)
                    Button("lightining strike -20 M"){
                        if PlayerMana >= 20 {
                            Playerdmg = Int.random(in: 1..<5) + PlayerdmgmagicBonus
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
                            Attackline = "You don't have enough mana"
                        }
                    }
                    .buttonStyle(CustomButtonStyle2())
                    .opacity(FightOpac)
                    
                    
                }
                .offset(x:0, y:-300)
                
            }
               
        }
            .background(
                    Image("background")
                        .scaledToFit()
                )
            .onReceive(timer) { time in
                guard isTimerActive else { return }
                
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }
            }
                    .onChange(of: scenePhase) { newPhase in
                        if newPhase == .active {
                            isTimerActive = true
                        } else {
                            isTimerActive = false
                        }
                    }
        }
        .navigationBarBackButtonHidden(true)
    }
    func CheckPlayerHealth() {
        if AttackHealth <= 0 {
            DeadOpac = 1.0
            ReadyOpac = 0.0
            FightOpac = 0.0
        }
    }
    func CheckMonsterHealth() {
        RandomItemSelect = Int.random(in: 0..<4)
        if monsterHealth <= 0 {
            itemEarned = itemArray[RandomItemSelect]
            Attackline = "You killed the monster you get \(itemEarned)"
            Reaction = ""
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


struct CustomButtonStyle2: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 90, height: 45)
            .font(Font.custom("Marker Felt", size: 16))
            .padding()
            .background(.red).opacity(configuration.isPressed ? 0.0 : 1.0)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}







