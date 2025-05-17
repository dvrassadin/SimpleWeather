//
//  NetworkService.swift
//  SimpleWeather
//
//  Created by Daniil Rassadin on 12/5/25.
//

import OSLog

@MainActor
final class NetworkService: NetworkServiceProtocol {
    static let shared = NetworkService()
    
    // MARK: Properties
    
    private let session: URLSession = {
        let session = URLSession(configuration: .default)
        session.configuration.timeoutIntervalForRequest = 10
        return session
    }()
    
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
        return decoder
    }()
    
    private let baseURL: URL = {
        guard let url = URL(string: "http://api.weatherapi.com/") else {
            fatalError("Invalid base URL")
        }
        return url
    }()
    
    private let apiKey = "fa8b3df74d4042b9aa7135114252304"
    
    private let logger = Logger(
        subsystem: Bundle.main.bundleIdentifier ?? "",
        category: "Networking"
    )
    
    // MARK: Initialization
    
    private init() {}
}
