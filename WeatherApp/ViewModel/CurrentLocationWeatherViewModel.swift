//
//  CurrentLocationWeatherViewModel.swift
//  WeatherApp
//
//  Created by Bidhan Chandra Roy on 23/02/24.
//

import Combine
import Foundation

class CurrentLocationWeatherViewModel: ObservableObject {
    var locationManager: LocationManager?
    var weatherAPI: WeatherAPI?
    var cancellables = Set<AnyCancellable>()

    init(locationManager: LocationManager? = .init(),
         weatherAPI: WeatherAPI?) {
        self.locationManager = locationManager
        self.weatherAPI = weatherAPI
        locationManager?.locationCallBack = {[weak self] (location, error, status) in
            guard let self else { return }
            if let location {
                let lat = String(describing: location.coordinate.latitude)
                let long = String(describing: location.coordinate.longitude)
                self.fetchKeyForCurrentLocation(lat: lat,
                                                    long: long)
            }
        }
    }

    private func fetchKeyForCurrentLocation(lat: String, long: String) {
        self.weatherAPI?.fetchData(queryParams: [lat, long])?
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { failure in
               print(failure)
            }, receiveValue: { (model: CurrentLocationModel) in
                print(model)
            }).store(in: &cancellables)
    }

    private func fetchCurrentLocation(for locationKey: String) {
        
    }
}
