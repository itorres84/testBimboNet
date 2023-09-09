//
//  HomeFactory.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 08/09/23.
//

import Foundation
import UIKit

protocol HomeFactory {
    func createHomeModule() -> UIViewController
}

final class HomeFactoryImp: HomeFactory {
    
    func createHomeModule() -> UIViewController {
        return UIViewController()
    }

}

