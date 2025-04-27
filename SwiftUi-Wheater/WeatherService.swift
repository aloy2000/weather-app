//
//  WeatherService.swift
//  SwiftUi-Wheater
//
//  Created by RAMANANDRAIBE Nirintsoa on 27/04/2025.
//

import Foundation


class WeatherService {
    func fetchWeather(latitude:Double, longitude:Double, completion: @escaping (Result<CurrentWeather, Error>) -> Void) {
        let urlString =  "https://api.open-meteo.com/v1/forecast?latitude=\(latitude)&longitude=\(longitude)&current_weather=true"
        
        guard let url =  URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(NSError(domain: "No data", code: 0)))
                }
                return
            }
            print("data: \(data)")
            do {
                let decodedResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedResponse.current_weather))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
