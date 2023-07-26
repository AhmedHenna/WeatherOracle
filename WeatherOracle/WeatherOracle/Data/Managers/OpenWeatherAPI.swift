//
//  OpenWeatherAPI.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/23/23.
//

import Foundation

class OpenWeatherAPI {
    private let apiKey = "504b445fbc87485e980dcd1afc8a9925"

    func fetchWeatherData(lat: Double, lon: Double, completion: @escaping (Result<Weather, Error>) -> Void) {
        let baseURL = "https://api.openweathermap.org/data/3.0/onecall"
        let urlString = "\(baseURL)?lat=\(lat)&lon=\(lon)&exclude=minutely,alerts&units=metric&appid=\(apiKey)"

        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .secondsSince1970
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let weatherResponse = try decoder.decode(Weather.self, from: data)
                completion(.success(weatherResponse))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
