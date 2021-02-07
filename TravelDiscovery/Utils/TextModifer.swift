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

struct Heading: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.system(size: 18, weight: .bold))
    }
}

extension View {
    func smallSemiboldText() -> some View {
        self.modifier(SmallSemiboldText())
    }
    
    func heading() -> some View {
        self.modifier(Heading())
    }
}

struct TextModifer: View {
    var body: some View {
        Text("I am a heading").heading()
        
        Text("Small and semibold text").smallSemiboldText()
    }
}

struct TextModifer_Previews: PreviewProvider {
    static var previews: some View {
        TextModifer()
    }
}
