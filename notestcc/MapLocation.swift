//
//  MapLocation.swift
//  notestcc
//
//  Created by Igor Bueno Franco on 26/07/23.
//

import Foundation
import MapKit

struct MapLocation: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
