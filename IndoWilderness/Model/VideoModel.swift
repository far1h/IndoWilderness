//
//  VideoModel.swift
//  IndoWilderness
//
//  Created by Farih Muhammad on 13/08/2024.
//

import Foundation

struct Video: Identifiable, Codable {
    let id: String
    let name: String
    let headline: String
    
    // Computed Propertyu
    var thumbnail: String {
        "video-\(id)"
    }
}
