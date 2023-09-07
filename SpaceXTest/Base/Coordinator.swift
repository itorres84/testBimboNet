//
//  Coordinator.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 07/09/23.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    @discardableResult func start() -> UIViewController
}
