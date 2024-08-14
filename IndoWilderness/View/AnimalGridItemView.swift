//
//  AnimalGridItemView.swift
//  IndoWilderness
//
//  Created by Farih Muhammad on 14/08/2024.
//

import SwiftUI

struct AnimalGridItemView: View {
    // MARK: - PROPERTIES
    
    let animal: Animal
    // MARK: - BODY
    var body: some View {
        Image(animal.image)
            .resizable()
//                        .scaledToFill() // Scale to fill the container
                        .aspectRatio(2560 / 1600, contentMode: .fit) // Maintain a 2560x1600 aspect ratio
                        .clipped() // Clip any overflow
                        .cornerRadius(12)
    }
}
// MARK: - PREVIEW
struct AnimalGridItemView_Previews: PreviewProvider {
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalGridItemView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
