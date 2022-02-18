//
//  MapView.swift
//  OpenWeather
//
//  Created by Evana Islam on 17/3/21.
//

import SwiftUI
import MapKit

// Showing warning for iOS 13, 14: [Renderer] IconRenderer: Left horizontal padding (18.000000) plus right horizontal padding (18.000000) is larger than the image width (34.000000). Image will now use the center column of pixels to stretch.
// https://developer.apple.com/forums/thread/652993
// https://stackoverflow.com/questions/58536653/iconrenderer-warning-in-xcode-11-2

struct MapView: UIViewRepresentable {
    private let coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.0275, longitudeDelta: 0.0275)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        view.addAnnotation(annotation)
    }
}
