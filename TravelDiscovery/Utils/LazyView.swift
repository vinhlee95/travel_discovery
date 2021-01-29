//
//  LazyView.swift
//  TravelDiscovery
//
//  Created by Vinh Le on 1/29/21.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}
