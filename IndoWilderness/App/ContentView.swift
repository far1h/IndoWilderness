//
//  ContentView.swift
//  IndoWilderness
//
//  Created by Farih Muhammad on 12/08/2024.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive : Bool = false
    @State private var searchText: String = ""
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    // MARK: - FUNCTIONS
    
    func gridSwitch() {
        
        
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1 )
        gridColumn = gridLayout.count
        print("Grid Number: \(gridColumn)")
        switch gridColumn {
            
        case 1:
            
            toolbarIcon = "rectangle.grid.1x2"
            
        case 2:
            
            toolbarIcon = "square.grid.2x2"
            
        case 3:
            
            toolbarIcon = "square.grid.3x2"
            
        default:
            
            toolbarIcon = "square.grid.2x2"
            
        }
        
    }
    // Filtered animals based on search text
    var filteredAnimals: [Animal] {
        if searchText.isEmpty {
            return animals
        } else {
            return animals.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(filteredAnimals) { animal in
                            NavigationLink {
                                AnimalDetailView(animal: animal)
                            } label: {
                                AnimalListItemView(animal: animal)
                            } //: LINK
                        } //: LOOP
                        CreditsView()
                            .modifier(CenterModifier())
                    } //: LIST
                    .listStyle(.plain)
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(filteredAnimals) { item in
                                NavigationLink(destination: {
                                    AnimalDetailView(animal: item)
                                }, label: {
                                    AnimalGridItemView(animal: item)
                                }) //: LINK
                            } //: LOOP
                        } //: GRID
                        .padding(10)
                        //                        .animation(.easeIn)
                    } //: SCROLL
                } //: CONDITION
            } //: GROUP
            .navigationBarTitle("Animals of Indonesia", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        // LIST
                        Button {
                            print("List view is activated")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        // GRID
                        Button {
                            print("Grid view is activated")
                            isGridViewActive = true
                            haptics.impactOccurred()
                            withAnimation(.easeIn) {
                                gridSwitch()
                            }
                        } label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                        
                        
                    }
                }
            } //: TOOLBAR
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always)) // Search bar
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
