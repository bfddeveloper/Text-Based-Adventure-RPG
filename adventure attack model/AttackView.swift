//
//  AttackView.swift
//  adventure attack model
//
//  Created by Brody Dickson on 4/11/23.
//

import SwiftUI

struct AttackView: View {
    @State var engagedMoster = EngagedMonster
    @State var monsterHealth = EngagedMonster.health
    var body: some View {
        NavigationView {
            Text("")
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Attack")
    }
        
}

struct AttackView_Previews: PreviewProvider {
    static var previews: some View {
        AttackView()
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

struct health: Codable {
    
}

struct Dmg: Codable {
    
}

