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

}
