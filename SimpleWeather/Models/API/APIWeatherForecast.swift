//
//  APIWeatherForecast.swift
//  SimpleWeather
//
//  Created by Daniil Rassadin on 13/5/25.
//

import Foundation

struct APIWeatherForecast: Decodable {
    let location: Location
    let current: Current
    let forecast: Forecast
    
    struct Location: Decodable {
        let name: String
    }
    
    struct Current: Decodable {
        
    }
    
    struct Forecast: Decodable {
        let forecastday: [Forecastday]
        
        struct Forecastday: Decodable {
            
        }
    }
}
