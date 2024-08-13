//
//  LocationModel.swift
//  IndoWilderness
//
//  Created by Farih Muhammad on 13/08/2024.
//

import Foundation
import MapKit

struct NationalParkLocation: Identifiable, Codable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
//    Computed Property
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
