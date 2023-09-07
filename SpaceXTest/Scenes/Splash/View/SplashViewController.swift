//
//  SplashViewController.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 07/09/23.
//

import UIKit

class SplashViewController: UIViewController {

    var coordinator: SplashCoordinator?
    let viewModel: SplashViewModel
    
    init(viewModel: SplashViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        bindViewModel()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel.fetchSynchronize()
    }
    
    private func bindViewModel() {
        viewModel.bindSynchronizeViewModelToController = {
            self.goToLogin()
        }
    }
    
    func goToLogin() {
        coordinator?.goToLogin()
    }
    
}
