//
//  ContentView.swift
//  MyGitJeff
//
//  Created by jeffrey lullen on 5/3/26.
//

import SwiftUI

struct ContentView: View {
    
    // [] = array == multiple things in one place
    // {} in javascript = object
    // key : value pair
    
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
