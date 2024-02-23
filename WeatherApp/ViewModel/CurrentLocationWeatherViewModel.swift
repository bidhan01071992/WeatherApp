//
//  CurrentLocationWeatherViewModel.swift
//  WeatherApp
//
//  Created by Bidhan Chandra Roy on 23/02/24.
//

import Foundation

class CurrentLocationWeatherViewModel: ObservableObject {
    var locationManager: LocationManager?

    init(locationManager: LocationManager? = .init()) {
        self.locationManager = locationManager
        locationManager?.locationCallBack = {[weak self] (location, error, status) in
            guard let self else { return }
            if let location {
                self.fetchWeatherForCurrentLocation(lat: location.coordinate.latitude,
                                                    long: location.coordinate.longitude)
            }
        }
    }

    func fetchWeatherForCurrentLocation(lat: Double, long: Double) {
        
    }
}
