//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Bidhan Chandra Roy on 22/02/24.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject {
    var locationManager = CLLocationManager()
    @Published var authorizationStatus: CLAuthorizationStatus?
    @Published var location: CLLocation?
    @Published var error: Error?
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:
            authorizationStatus = .authorizedWhenInUse
            manager.requestLocation()
            break
        case .restricted, .denied:
            authorizationStatus = .restricted
            break
        case .notDetermined:
            authorizationStatus = .notDetermined
            manager.requestWhenInUseAuthorization()
            break
        default:
            break
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        self.location = location
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.error = error
    }
}
