//
//  DeathView.swift
//  adventure attack model
//
//  Created by Owen Johnson on 5/11/23.
//

import SwiftUI

struct DeathView: View {
    var body: some View {
        ZStack {
            Color.mint
                .ignoresSafeArea()
            VStack {
                Text("💀")
                    .font(Font.custom("Marker Felt", size: 130))
                Text("YOU DIED, TRY AGAIN?")
                    .font(Font.custom("Marker Felt", size: 50))
                    .padding()
                Text("💀")
                    .font(Font.custom("Marker Felt", size: 130))
                    .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct DeathView_Previews: PreviewProvider {
    static var previews: some View {
        DeathView()
    }
}
