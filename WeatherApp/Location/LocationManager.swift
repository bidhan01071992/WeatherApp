//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Bidhan Chandra Roy on 22/02/24.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject {
    var locationManager = CLLocationManager()
    var locationCallBack: ((CLLocation?, Error?, CLAuthorizationStatus?) -> ())?

    override init() {
        super.init()
        locationManager.delegate = self
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        locationCallBack?(nil, nil, manager.authorizationStatus)
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:
            manager.requestLocation()
            break
        case .restricted, .denied:
            break
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
            break
        default:
            break
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        locationCallBack?(location, nil, nil)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationCallBack?(nil, error, nil)
    }
}
