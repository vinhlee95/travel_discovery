//
//  TileModifier.swift
//  TravelDiscovery
//
//  Created by Vinh Le on 1/26/21.
//

import SwiftUI

struct TileModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: .gray, radius: 5, x: 0.0, y: 2)
            .padding(.bottom, 8)
    }
}

extension View {
    func tileStyle() -> some View {
        self.modifier(TileModifier())
    }
}

struct TileModifierView: View {
    var body: some View {
        Spacer()
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            .tileStyle()
    }
}

struct TileModifier_Previews: PreviewProvider {
    static var previews: some View {
        TileModifierView()
    }
}
