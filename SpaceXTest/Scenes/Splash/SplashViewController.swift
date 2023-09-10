//
//  SplashViewController.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 07/09/23.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {
    
    lazy var animation: LottieAnimationView = {
        let lottieAniamtion: LottieAnimationView = LottieAnimationView(name: "splash_animation")
        lottieAniamtion.translatesAutoresizingMaskIntoConstraints = false
        lottieAniamtion.contentMode = .scaleAspectFit
        lottieAniamtion.loopMode = .loop
        return lottieAniamtion
    }()
    
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
        self.addSubViews()
        self.addConstraints()
        animation.play()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.fetchSynchronize()
    }
    
    private func addSubViews() {
        view.addSubview(animation)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            animation.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animation.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            animation.widthAnchor.constraint(equalToConstant: Dimensions.sizeAnimation),
            animation.heightAnchor.constraint(equalToConstant: Dimensions.sizeAnimation)
        ])
    }
    
    private func bindViewModel() {
        viewModel.bindSynchronizeViewModelToController = {
            self.goToLogin()
        }
    }
    
    private func goToLogin() {
        coordinator?.goToLogin()
    }
}

extension SplashViewController {
    struct Dimensions {
        static let sizeAnimation: CGFloat = 300
    }
}
