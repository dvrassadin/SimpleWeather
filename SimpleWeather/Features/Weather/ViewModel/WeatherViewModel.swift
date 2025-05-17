//
//  WeatherViewModel.swift
//  SimpleWeather
//
//  Created by Daniil Rassadin on 12/5/25.
//

import Foundation

final class WeatherViewModel: WeatherViewModelProtocol {
    
    // MARK: Properties
    
    let locationService: LocationServiceProtocol
    let networkService: NetworkServiceProtocol
    
    // MARK: Initialization
    
    init(locationService: LocationServiceProtocol, networkService: NetworkServiceProtocol) {
        self.locationService = locationService
        self.networkService = networkService
    }
    
}
