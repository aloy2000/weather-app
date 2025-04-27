//
//  WeatherResponse.swift
//  SwiftUi-Wheater
//
//  Created by RAMANANDRAIBE Nirintsoa on 27/04/2025.
//

import Foundation

struct WeatherResponse: Decodable {
    let current_weather: CurrentWeather
}

struct CurrentWeather: Decodable {
    let temperature: Double
    let windspeed: Double
}
