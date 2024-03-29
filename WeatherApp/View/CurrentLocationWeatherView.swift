//
//  CurrentLocationWeatherView.swift
//  WeatherApp
//
//  Created by Bidhan Chandra Roy on 21/02/24.
//

import SwiftUI

struct CurrentLocationWeatherView: View {

    @StateObject var currentLocationViewModel: CurrentLocationWeatherViewModel

    var body: some View {
        VStack {
            BackgroundAnimationView(model: .init(weatherBackground: .Cloudy))
        }
        
    }
}
