//
//  MissionTableViewCell.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 09/09/23.
//

import UIKit

class MissionTableViewCell: UITableViewCell {
    
    struct Dimensions {
        static let sizeImageView: CGFloat = 80
        static let marginShadow: CGFloat = 5
        static let marginLefthStack: CGFloat = 10
    }
    
    lazy var shadowView: UIView = {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.layer.masksToBounds = false
        view.layer.shadowRadius = 3
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: -1, height: 3)
        view.layer.shadowColor = UIColor.black.cgColor
        return view
    }()
    
    lazy var missionPatchImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var stackView: UIStackView = {
        let stack: UIStackView = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        return stack
    }()
    
    lazy var labelName: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        return label
    }()
    
    lazy var labelSiteName: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var labelLaunchDate: UILabel = {
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
        addSubview(shadowView)
        addSubview(missionPatchImageView)
        addSubview(stackView)
        stackView.addArrangedSubview(labelName)
        stackView.addArrangedSubview(labelSiteName)
        stackView.addArrangedSubview(labelLaunchDate)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: topAnchor, constant: Dimensions.marginShadow),
            shadowView.rightAnchor.constraint(equalTo: rightAnchor, constant: -Dimensions.marginShadow),
            shadowView.leftAnchor.constraint(equalTo: leftAnchor, constant: Dimensions.marginShadow),
            shadowView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Dimensions.marginShadow)
        ])
        NSLayoutConstraint.activate([
            missionPatchImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            missionPatchImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            missionPatchImageView.widthAnchor.constraint(equalToConstant: Dimensions.sizeImageView),
            missionPatchImageView.heightAnchor.constraint(equalToConstant: Dimensions.sizeImageView)
        ])
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            stackView.leftAnchor.constraint(equalTo: missionPatchImageView.rightAnchor, constant: Dimensions.marginLefthStack),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
    func configure(mission: Mission) {
        missionPatchImageView.imageFromUrl(urlString: mission.links.missionPatchSmall)
        labelName.text = mission.missionName
        labelSiteName.text = mission.siteName
        labelLaunchDate.text = mission.launch
    }
    
}
