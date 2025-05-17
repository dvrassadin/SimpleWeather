//
//  WeatherViewController.swift
//  SimpleWeather
//
//  Created by Daniil Rassadin on 12/5/25.
//

import UIKit

final class WeatherViewController: UIViewController {
    
    // MARK: Properties
    
    private let viewModel: WeatherViewModel
    
    // MARK: Lifecycle
    
    init(viewModel: WeatherViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        Task {
            try await NetworkService.shared.getWeatherForecast(
                latitude: 55.75866,
                longitude: 37.61929,
                days: 2
            )
        }
    }

}
