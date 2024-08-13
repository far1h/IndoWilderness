//
//  MapView.swift
//  IndoWilderness
//
//  Created by Farih Muhammad on 12/08/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: - PROPERTIES
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    // MARK: - BODY
    
    var body: some View {
        // MARK: - 1. Basic Map
//        Map(coordinateRegion: $region)
        
        // MARK: - 2. Advanced Map
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            // PIN: OLD STYLE (STATIC)
            
//            MapPin(coordinate: item.location, tint: .accentColor)
            
            // MARKER: NEW STYLE (STATIC)
            
//            MapMarker(coordinate: item.location, tint: .accentColor)
            
            // CUSTOM BASIC ANNOTATION (INTERACTIVE)
            
//            MapAnnotation(coordinate: item.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32, alignment: .center)
//            } //: ANNOTATION
            
            // CUSTOM ADVANCED ANNOTATION (INTERACTIVE)
            
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item )
            } //: ANNOTATION
        } //: MAP
        .overlay(alignment: .top) {
            HStack (alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    Divider()
                    HStack {
                        Text("Longitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
            } //: HSTACK
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background {
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            }
            .padding()
        }
    }
}
// MARK: - PREVIEW
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
