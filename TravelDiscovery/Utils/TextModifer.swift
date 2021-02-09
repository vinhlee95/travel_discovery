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

// Make Text to render with all lines that it needs
// https://stackoverflow.com/questions/56507497/views-compressed-by-other-views-in-swiftui-vstack-and-list/57677746#57677746

struct FullSizeDisplay: ViewModifier {
    func body(content: Content) -> some View {
        content.fixedSize(horizontal: false, vertical: true)
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

extension Text {
    func displayFullSize() -> some View {
        self.modifier(FullSizeDisplay())
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
