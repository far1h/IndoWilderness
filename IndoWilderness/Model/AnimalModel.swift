//
//  AnimalModel.swift
//  IndoWilderness
//
//  Created by Farih Muhammad on 13/08/2024.
//

import SwiftUI
struct Animal : Identifiable, Codable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
    }
