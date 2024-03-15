//
//  CurrentLocationModel.swift
//  WeatherApp
//
//  Created by Bidhan Chandra Roy on 15/03/24.
//

import Foundation

struct CurrentLocationModel: Codable {
    var key: String
    
    enum CodingKeys: String, CodingKey {
        case key = "Key"
    }
}
