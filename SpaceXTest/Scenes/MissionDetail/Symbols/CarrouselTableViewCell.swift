//
//  CarrouselTableViewCell.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 11/09/23.
//

import UIKit

class CarrouselTableViewCell: UITableViewCell {
    
    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(cellType: BannerCollectionViewCell.self, withNib: false)
        collection.dataSource = self
        collection.delegate = self
        collection.isScrollEnabled = true
        collection.isUserInteractionEnabled = true
        collection.isPagingEnabled = true
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    lazy var pageControll: UIPageControl = {
        let pageControll: UIPageControl = UIPageControl()
        pageControll.currentPageIndicatorTintColor = .blue
        pageControll.pageIndicatorTintColor = .gray
        pageControll.translatesAutoresizingMaskIntoConstraints = false
        return pageControll
    }()
    
    var images: [String] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
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
        isUserInteractionEnabled = true
    }
    
    private func addSubviews() {
        contentView.addSubview(collectionView)
        contentView.addSubview(pageControll)
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        NSLayoutConstraint.activate([
            pageControll.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -30),
            pageControll.rightAnchor.constraint(equalTo: rightAnchor),
            pageControll.leftAnchor.constraint(equalTo: leftAnchor),
            pageControll.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configure(images: [String]) {
        self.images = images
        pageControll.numberOfPages = images.count
    }
    
}

extension CarrouselTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: BannerCollectionViewCell.self, for: indexPath)
        cell.loadImage(urlImage: images[indexPath.row])
        return cell
    }
    
}
extension CarrouselTableViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: self.collectionView.contentOffset, size: self.collectionView.bounds.size)
            let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
            if let visibleIndexPath = self.collectionView.indexPathForItem(at: visiblePoint) {
                pageControll.currentPage = visibleIndexPath.row
            }
    }
}

