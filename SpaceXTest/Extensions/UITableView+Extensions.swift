//
//  UITableView+Extensions.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 09/09/23.
//

import UIKit

public protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

public extension ClassNameProtocol {
    
    static var className: String {
        String(describing: self)
    }
    
    var className: String {
        type(of: self).className
    }
    
}

extension NSObject: ClassNameProtocol { }

public extension UITableView {
    
    func register<T: UITableViewCell>(cell: T.Type) {
        register(cell, forCellReuseIdentifier: cell.className)
    }
    
    func register<T: UITableViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let className = cellType.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forCellReuseIdentifier: className)
    }
    
    func register<T: UITableViewCell>(cellTypes: [T.Type], bundle: Bundle? = nil) {
        cellTypes.forEach { register(cellType: $0, bundle: bundle) }
    }
    
    func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        self.dequeueReusableCell(withIdentifier: type.className, for: indexPath) as? T ?? T()
    }
    
    func register<T: UITableViewHeaderFooterView>(viewType: T.Type, bundle: Bundle? = nil) {
        let className = viewType.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forHeaderFooterViewReuseIdentifier: className)
    }
    
    func dequeueReusableView<T: UITableViewHeaderFooterView>(with type: T.Type) -> T {
        dequeueReusableHeaderFooterView(withIdentifier: type.className) as? T ?? T()
    }
    
    func addTableHeaderViewLine() {
        self.tableHeaderView = {
            let line = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 1 / UIScreen.main.scale))
            line.backgroundColor = self.separatorColor
            return line
        }()
    }
    
    func isCellVisible(section:Int, row: Int) -> Bool {
        guard let indexes = self.indexPathsForVisibleRows else { return false }
        return indexes.contains {$0.section == section && $0.row == row }
    }
}
