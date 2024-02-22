//
//  CurrentLocationWeatherView.swift
//  WeatherApp
//
//  Created by Bidhan Chandra Roy on 21/02/24.
//

import SwiftUI

struct CurrentLocationWeatherView: View {
    @StateObject var locationManager = LocationManager()
    var body: some View {
        VStack {
            BackgroundAnimationView(model: .init(weatherBackground: .Cloudy))
            Text("Latitude: \(locationManager.location?.coordinate.latitude.description ?? "Error loading")")
            Text("Longitude: \(locationManager.location?.coordinate.longitude.description ?? "Error loading")")
        }
        
    }
}
