//
//  Note.swift
//  notestcc
//
//  Created by Igor Bueno Franco on 25/07/23.
//

import Foundation
import MapKit
import UIKit

struct Note: Identifiable {
    let id = UUID()
    var title: String
    var content: String
    var date: Date
    var location: CLLocationCoordinate2D?
    var image: UIImage?
}
