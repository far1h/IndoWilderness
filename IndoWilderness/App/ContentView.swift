//
//  ContentView.swift
//  IndoWilderness
//
//  Created by Farih Muhammad on 12/08/2024.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            } //: LIST
            .listStyle(.plain)
            .navigationBarTitle("IndoWilderness", displayMode: .large)
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
