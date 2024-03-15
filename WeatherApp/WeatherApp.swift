//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Bidhan Chandra Roy on 21/02/24.
//

import SwiftUI

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            CurrentLocationWeatherView(currentLocationViewModel: .init(weatherAPI: CurrenLocationWeatherAPI()))
        }
    }
}
