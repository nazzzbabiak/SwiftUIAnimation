//
//  ContentView.swift
//  AnimatedSwiftUiTry
//
//  Created by Nazar Babyak on 16.03.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
