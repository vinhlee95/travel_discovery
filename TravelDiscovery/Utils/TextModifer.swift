//
//  TextModifer.swift
//  TravelDiscovery
//
//  Created by Vinh Le on 1/26/21.
//

import SwiftUI

struct SmallSemiboldText: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.system(size: 12, weight: .semibold))
    }
}

extension View {
    func smallSemiboldText() -> some View {
        self.modifier(SmallSemiboldText())
    }
}

struct TextModifer: View {
    var body: some View {
        Text("Small and semibold text").smallSemiboldText()
    }
}

struct TextModifer_Previews: PreviewProvider {
    static var previews: some View {
        TextModifer()
    }
}
