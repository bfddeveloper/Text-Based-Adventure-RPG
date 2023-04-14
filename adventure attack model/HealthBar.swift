//
//  ProgressBar.swift
//  adventure attack model
//
//  Created by Oliver Halvey on 4/14/23.
//

import SwiftUI

struct HealthBar: View {
    var health: CGFloat
    var body: some View {
        ZStack(alignment: .leading) {
                   Rectangle()
                       .frame(maxWidth: 350, maxHeight: 4)
                       .foregroundColor(.green)
                       .cornerRadius(10)
                   Rectangle()
                       .frame(width: health, height: 4)
                       .foregroundColor(.green)
                       .cornerRadius(10)

               }
    }
}

struct HealthBar_Previews: PreviewProvider {
    static var previews: some View {
        HealthBar(health: 50)
    }
}
