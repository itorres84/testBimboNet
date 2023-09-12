//
//  BannerCollectionViewCell.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 11/09/23.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    lazy var bannerImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    init() {
        super.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(bannerImageView)
        NSLayoutConstraint.activate([
            bannerImageView.topAnchor.constraint(equalTo: topAnchor),
            bannerImageView.rightAnchor.constraint(equalTo: rightAnchor),
            bannerImageView.leftAnchor.constraint(equalTo: leftAnchor),
            bannerImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func loadImage(urlImage: String) {
        bannerImageView.imageFromUrl(urlString: urlImage)
    }
    
}
