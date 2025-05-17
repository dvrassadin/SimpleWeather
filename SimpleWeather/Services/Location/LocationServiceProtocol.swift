//
//  LocationServiceProtocol.swift
//  SimpleWeather
//
//  Created by Daniil Rassadin on 12/5/25.
//

import CoreLocation

@MainActor
protocol LocationServiceProtocol {
    func requestAuthorizationIfNeeded()
    func requestCurrentLocation(completion: @escaping (CLLocation?) -> Void)
}
