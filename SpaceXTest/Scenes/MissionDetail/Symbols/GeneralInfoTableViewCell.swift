//
//  GeneralInfoTableViewCell.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 11/09/23.
//

import UIKit

class GeneralInfoTableViewCell: UITableViewCell {
    
    struct Dimension {
        static let margins: CGFloat = 5.0
    }
    
    lazy var stackView: UIStackView = {
        let stack: UIStackView = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
        return stack
    }()
    
    lazy var labelLaunchDate: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var labelSite: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var labelRocketName: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var labelRocketType: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
    }
    
    private func addSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(labelLaunchDate)
        stackView.addArrangedSubview(labelSite)
        stackView.addArrangedSubview(labelRocketName)
        stackView.addArrangedSubview(labelRocketType)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: Dimension.margins),
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: Dimension.margins),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -Dimension.margins),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Dimension.margins)
        ])
    }
    
    func configure(model: GeneralInfo) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: model.date)
        labelLaunchDate.text = date?.description
        
        if let finalDate = date {
            formatter.dateFormat = "EEEE, MMM d, yyyy"
            let newDate = formatter.string(from: finalDate)
            labelLaunchDate.text = newDate.description
        }
        labelSite.text = "Site: \(model.rocketName)"
        labelRocketName.text = "Rocket name: \(model.rocketName)"
        labelRocketType.text = "Rocket type: \(model.rocketType)"
    }
    
}
