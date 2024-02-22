//
//  CurrentLocationWeatherView.swift
//  WeatherApp
//
//  Created by Bidhan Chandra Roy on 21/02/24.
//

import SwiftUI

struct CurrentLocationWeatherView: View {
    var body: some View {
        BackgroundAnimationView(model: .init(weatherBackground: .Cloudy))
    }
}
