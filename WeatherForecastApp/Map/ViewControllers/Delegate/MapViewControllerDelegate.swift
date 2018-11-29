//
//  MapViewControllerDelegate.swift
//  WeatherForecastApp
//
//  Created by kayeli dennis on 29/11/2018.
//  Copyright © 2018 kayeli dennis. All rights reserved.
//

import Foundation
import MapKit

extension MapViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else { return nil }
        let reuseId = "Identifier"
        var View = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        if View == nil {
            View = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
        }
        View?.pinTintColor = UIColor.blue
        View?.canShowCallout = true
        let smallSquare = CGSize(width: 30, height: 30)
        let button = UIButton(frame: CGRect(origin: .zero, size: smallSquare))
        button.setImage(#imageLiteral(resourceName: "bookmark"), for: .normal)
        button.setImage(#imageLiteral(resourceName: "bookmark-selected"), for: .highlighted)
        button.setImage(#imageLiteral(resourceName: "bookmark-selected"), for: .selected)
        View?.leftCalloutAccessoryView = button
        return View
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if let annotation = view.annotation {
            let point = MKPointAnnotation.init()
            point.coordinate = annotation.coordinate
            bookmark(annotation: point)
        }
    }
}

extension MapViewController: MapSearch {
        
        func dropPinZoomIn(placemark: MKPlacemark){
            // cache the pin
            selectedPin = placemark
            // clear existing pins
            mapView.removeAnnotations(mapView.annotations)
            let annotation = MKPointAnnotation()
            annotation.coordinate = placemark.coordinate
            annotation.title = placemark.name
            if let city = placemark.locality {
                annotation.subtitle = "Tap the bookmark icon to add \(city) to your bookmarks for weather forecast!"
            }
            mapView.addAnnotation(annotation)
            let span = MKCoordinateSpanMake(0.05, 0.05)
            let region = MKCoordinateRegionMake(placemark.coordinate, span)
//            mapView.setRegion(region, animated: true)
            mapView.showAnnotations(mapView.annotations, animated: true)
        }
}
extension MapViewController : CLLocationManagerDelegate {
    
    func bookmark (annotation: MKPointAnnotation) {
        let place = Place.init(annotation: annotation)
        let addViewModel = AddBookMarkViewModel.init(place: place)
        let vc = AddBookMarkViewController.instantiate(from: AppStoryBoards.AddBookMark)
        vc.viewModel = addViewModel
        self.navigationController?.pushViewController(vc, animated: true)
    }

    private func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location.coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error)")
    }
}
