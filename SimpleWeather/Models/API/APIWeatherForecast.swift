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
        let tempC: Double
        let condition: Condition
        
        struct Condition: Decodable {
            let text: String
            let icon: String
        }
    }
    
    struct Forecast: Decodable {
        let forecastday: [Forecastday]
        
        struct Forecastday: Decodable {
            let day: Day
            
            struct Day: Decodable {
                let maxtempC: Double
                let mintempC: Double
            }
        }
    }
    
}
