//
//  ManaBar.swift
//  adventure attack model
//
//  Created by Oliver Halvey on 4/19/23.
//

import SwiftUI

struct ManaBar: View {
    var mana: CGFloat
    var body: some View {
        ZStack(alignment: .leading) {
                   Rectangle()
                       .frame(maxWidth: 350, maxHeight: 4)
                       .foregroundColor(.blue)
                       .cornerRadius(10)
                   Rectangle()
                       .frame(width: mana, height: 4)
                       .foregroundColor(.blue)
                       .cornerRadius(10)

               }
    }
}

struct ManaBar_Previews: PreviewProvider {
    static var previews: some View {
        HealthBar(health: 50)
    }
}

