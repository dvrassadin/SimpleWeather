//
//  LocationService.swift
//  SimpleWeather
//
//  Created by Daniil Rassadin on 12/5/25.
//

import OSLog

@MainActor
final class LocationService: LocationServiceProtocol {
    static let shared = LocationService()
    
    // MARK: Properties
    
    private let logger = Logger(
        subsystem: Bundle.main.bundleIdentifier ?? "",
        category: "Location"
    )
    
    // MARK: Initialization
    
    private init() {}
}
