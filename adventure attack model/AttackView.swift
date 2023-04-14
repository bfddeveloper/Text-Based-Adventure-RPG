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
    
    var body: some View {
        NavigationView {
            VStack{
                Text("The monster looks up at you grueling and ready to attack butt cheeks")
                Text(engagedMonster)
                Text(String(playerHealth))
            }
            HStack{
                Button("use"){
                    
                }
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Attack")
    }
//    func checkTheMonster() {
//        if engagedMonster
//    }
}

struct AttackView_Previews: PreviewProvider {
    static var previews: some View {
        AttackView(engagedMonster: "yo6", playerHealth: 20)
    }
}

struct blackRat: Codable {
    var health = 10
    var dmgmax = 5
    var Attack1 = "The Rat clawed you for"
    var Attack2 = "The Rat bites you for"
}
struct boss: Codable {
    
}

struct Player: Codable {
    
}

struct Dmg: Codable {
    
}

