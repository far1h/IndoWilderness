//
//  CenterModifier.swift
//  IndoWilderness
//
//  Created by Farih Muhammad on 14/08/2024.
//

import SwiftUI

struct CenterModifier : ViewModifier {
    func body(content: Content) -> some View {
        HStack{
            Spacer()
            content
            Spacer()
        }
    }
}
