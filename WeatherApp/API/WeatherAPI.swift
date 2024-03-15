//
//  WeatherAPI.swift
//  WeatherApp
//
//  Created by Bidhan Chandra Roy on 23/02/24.
//

import Combine
import Foundation

protocol WeatherAPI {
    func fetchData<T: Codable>(queryParams: [String]) -> AnyPublisher<T, Error>?
}

enum Constants: String {
    case APIKey
    case ServerBaseURL
    case GeopositionSubURL
}

class CurrenLocationWeatherAPI: WeatherAPI {

    func fetchData<T>(queryParams: [String]) -> AnyPublisher<T, Error>? where T : Decodable, T : Encodable {
        guard let baseURL = Bundle.main.infoDictionary?[Constants.ServerBaseURL.rawValue],
              let geopositionSubURL = Bundle.main.infoDictionary?[Constants.GeopositionSubURL.rawValue],
              let apiKEY = Bundle.main.infoDictionary?[Constants.APIKey.rawValue] else {
            return nil
        }
        let params = queryParams.joined(separator: ",").utf8
        let geopositionURLSTR = "\(baseURL)\(geopositionSubURL)?apikey=\(apiKEY)&q=\(params)"
        guard let apiURL = URL(string: geopositionURLSTR) else { return nil }
        return URLSession.shared.dataTaskPublisher(for: apiURL)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
