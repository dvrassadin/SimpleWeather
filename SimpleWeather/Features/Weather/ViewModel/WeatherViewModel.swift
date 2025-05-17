//
//  WeatherViewModel.swift
//  SimpleWeather
//
//  Created by Daniil Rassadin on 12/5/25.
//

import Foundation

final class WeatherViewModel: WeatherViewModelProtocol {
    
    // MARK: Properties
    
    var viewState: ((WeatherViewState) -> Void)?
    
    // MARK: Servicies
    
    let locationService: LocationServiceProtocol
    let networkService: NetworkServiceProtocol
    
    // MARK: Initialization
    
    init(locationService: LocationServiceProtocol, networkService: NetworkServiceProtocol) {
        self.locationService = locationService
        self.networkService = networkService
    }
    
    // MARK: Public Methods
    
    func viewIsAppearing() {
        fetchWeatherData()
    }
    
    func retryFetchWeather() {
        fetchWeatherData()
    }
    
    // MARK: Private Methods
    
    private func fetchWeatherData() {
        viewState?(.loading)
        Task {
            do {
                let weatherForecast = try await NetworkService.shared.getWeatherForecast(
                    latitude: 55.75866,
                    longitude: 37.61929,
                    days: 2
                )
                viewState?(.loaded(weather: weatherForecast))
            } catch {
                viewState?(.error(message: error.localizedDescription))
            }
        }
    }
}
