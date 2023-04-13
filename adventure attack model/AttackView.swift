//
//  AttackView.swift
//  adventure attack model
//
//  Created by Brody Dickson on 4/11/23.
//

import SwiftUI

struct AttackView: View {
    var body: some View {
        NavigationView {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
    
}
struct boss: Codable {
    
}

struct health: Codable {
    
}

struct Dmg: Codable {
    
}

