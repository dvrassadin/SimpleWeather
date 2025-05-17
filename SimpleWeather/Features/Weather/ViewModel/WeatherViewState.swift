//
//  WeatherViewState.swift
//  SimpleWeather
//
//  Created by Daniil Rassadin on 17/5/25.
//

import Foundation

enum WeatherViewState {
    case loading
    case loaded(weather: APIWeatherForecast)
    case error(message: String)
}
