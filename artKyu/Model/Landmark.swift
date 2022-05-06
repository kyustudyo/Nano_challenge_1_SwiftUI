/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A representation of a single landmark.
*/

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var isFeatured: Bool
    var category: Category
    
    enum Category: String, CaseIterable, Codable {
        case human = "Human"
        case basic = "Basic"
    }

    var imageName: String//private is ok but i have to use imageName outside.
    var image: Image {//Rather than used with imageName, property image is used.
        Image(imageName)
    }

    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
