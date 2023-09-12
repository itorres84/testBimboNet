//
//  UICollectionView+Extensions.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 11/09/23.
//

import Foundation
import UIKit

public extension UICollectionView {
    
    func pinHeaderToVisibleBounds() {
        (collectionViewLayout as? UICollectionViewFlowLayout)?.sectionHeadersPinToVisibleBounds = true
    }
    
    func invalidateLayout() {
        (collectionViewLayout as? UICollectionViewFlowLayout)?.invalidateLayout()
    }
    
    func register<T: UICollectionViewCell>(cellType: T.Type, withNib: Bool = true, bundle: Bundle? = nil) {
        
        let className = cellType.className
        
        if withNib {
            let nib = UINib(nibName: className, bundle: bundle)
            register(nib, forCellWithReuseIdentifier: className)
        } else {
            register(cellType, forCellWithReuseIdentifier: className)
        }
    }
    
    func register<T: UICollectionViewCell>(cellTypes: [T.Type], bundle: Bundle? = nil) {
        cellTypes.forEach { register(cellType: $0, bundle: bundle) }
    }
    
    func register<T: UICollectionReusableView>(reusableViewType: T.Type,
                                                      ofKind kind: String = UICollectionView.elementKindSectionHeader,
                                                      bundle: Bundle? = nil,
                                                      withNib: Bool = true) {
        let className = reusableViewType.className
        
        if withNib {
            let nib = UINib(nibName: className, bundle: bundle)
            register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: className)
        } else {
            register(reusableViewType, forSupplementaryViewOfKind: kind, withReuseIdentifier: className)
        }
    }
    
    func register<T: UICollectionReusableView>(reusableViewTypes: [T.Type],
                                                      ofKind kind: String = UICollectionView.elementKindSectionHeader,
                                                      bundle: Bundle? = nil) {
        reusableViewTypes.forEach { register(reusableViewType: $0, ofKind: kind, bundle: bundle) }
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(with type: T.Type,
                                                             for indexPath: IndexPath) -> T {
        dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as? T ?? T()
    }
    
    func dequeueReusableView<T: UICollectionReusableView>(with type: T.Type,
                                                                 for indexPath: IndexPath,
                                                                 ofKind kind: String = UICollectionView.elementKindSectionHeader) -> T {
        dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: type.className, for: indexPath) as? T ?? T()
    }
    
}
