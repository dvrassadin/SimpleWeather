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
    private lazy var contentView = WeatherView()
    
    // MARK: Lifecycle
    
    init(viewModel: WeatherViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        viewModel.viewIsAppearing()
    }
    
    // MARK: Setup
    
    private func setupBindings() {
        viewModel.viewState = { [weak self] viewState in
            self?.handleViewState(viewState)
        }
    }
    
    // MARK: Update UI
    
    private func handleViewState(_ state: WeatherViewState) {
        switch state {
        case .loading:
            contentView.showLoading()
        case .loaded(let weather):
            contentView.hideLoading()
            contentView.update(weather: weather)
        case .error(let message):
            contentView.hideLoading()
            showError(message: message)
        }
    }
    
    private func showError(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let refreshAction = UIAlertAction(title: "Try again", style: .default) { [weak self] _ in
            self?.viewModel.retryFetchWeather()
        }
        alertController.addAction(refreshAction)
        present(alertController, animated: true)
    }

}
