//
//  WeatherViewModel.swift
//  SimpleWeather
//
//  Created by Daniil Rassadin on 12/5/25.
//

import CoreLocation

final class WeatherViewModel: WeatherViewModelProtocol {
    
    // MARK: Properties
    
    var viewState: ((WeatherViewState) -> Void)?
    
    // MARK: Servicies
    
    private let locationService: LocationServiceProtocol
    private let networkService: NetworkServiceProtocol
    
    // MARK: Initialization
    
    init(locationService: LocationServiceProtocol, networkService: NetworkServiceProtocol) {
        self.locationService = locationService
        self.networkService = networkService
    }
    
    // MARK: Public Methods
    
    func viewDidLoad() {
        locationService.requestAuthorizationIfNeeded()
        fetchWeatherData()
    }
    
    func retryFetchWeather() {
        fetchWeatherData()
    }
    
    // MARK: Private Methods
    
    private func fetchWeatherData() {
        viewState?(.loading)
        locationService.requestCurrentLocation { [weak self] location in
            if let location {
                self?.fetchWeather(for: location.coordinate)
            } else {
                let moscowCoordinates = CLLocationCoordinate2D(
                    latitude: 55.75866,
                    longitude: 37.61929
                )
                self?.fetchWeather(for: moscowCoordinates)
            }
        }
    }
    
    private func fetchWeather(for coordinates: CLLocationCoordinate2D) {
        Task {
            do {
                let weatherForecast = try await NetworkService.shared.getWeatherForecast(
                    latitude: coordinates.latitude,
                    longitude: coordinates.longitude,
                    days: 2
                )
                viewState?(.loaded(weather: weatherForecast))
            } catch {
                viewState?(.error(message: error.localizedDescription))
            }
        }
    }
    
}
