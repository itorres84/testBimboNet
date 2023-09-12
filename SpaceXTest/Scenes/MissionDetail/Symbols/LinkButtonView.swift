//
//  LinkButtonView.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 11/09/23.
//

import UIKit

enum LinkButtonOption {
    case web(link: String)
    case youtube(link: String)
    
    func imageIcon() -> UIImage {
        switch self {
        case .web:
            return UIImage(named: "info") ?? UIImage()
        case .youtube:
            return UIImage(named: "youtube") ?? UIImage()
        }
    }
    
    func backgroundColorTwoButton() -> UIColor {
        switch self {
        case .web:
            return UIColor.blue
        case .youtube:
            return UIColor.red
        }
    }
    
    func titleColorTwoButton() -> String {
        switch self {
        case .web:
            return "Launch info"
        case .youtube:
            return "YT Video"
        }
    }
}


protocol LinkButtonViewDelegate: AnyObject {
    func tapButton(option: LinkButtonOption)
}

class LinkButtonView: UIView {

    lazy var stackView: UIStackView = {
        let stack: UIStackView = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        return stack
    }()
    
    lazy var buttonOne: UIImageView = {
        let button: UIImageView = UIImageView()
        button.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var buttonTwo: UIButton = {
        let button: UIButton = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        return button
    }()
    
    let option: LinkButtonOption
    weak var delegate: LinkButtonViewDelegate?

    init(option: LinkButtonOption) {
        self.option = option
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        addSubview(stackView)
        stackView.addArrangedSubview(buttonOne)
        stackView.addArrangedSubview(buttonTwo)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            buttonOne.widthAnchor.constraint(equalToConstant: 50),
            buttonOne.heightAnchor.constraint(equalToConstant: 50)
        ])
            
        buttonOne.image = option.imageIcon()
        buttonTwo.layer.cornerRadius = 25
        buttonTwo.clipsToBounds = true
        buttonTwo.backgroundColor = option.backgroundColorTwoButton()
        buttonTwo.setTitle(option.titleColorTwoButton(), for: .normal)
        buttonTwo.addTarget(self, action: #selector(self.buttonClicked(_:)), for:.touchUpInside)
    }
    
    @objc func buttonClicked(_ sender: UIButton) {
        delegate?.tapButton(option: option)
    }
    
}
