//
//  String+Extensions.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 09/09/23.
//

import Foundation

extension String {
    
    func localized() -> String {
        return localized(using: nil, in: .main)
    }

    func availableLAnguages() -> [String] {
        return Localize.availableLanguages()
    }

    func currentLanguage() -> String {
        return Localize.currentLanguage()
    }

    func defaultLanguage() -> String {
        return Localize.defaultLanguage()
    }

    func displayNameForLanguage() -> String {
        return Localize.displayNameForLanguage("es")
    }
    
    func localized(using tableName: String?, in bundle: Bundle?, type: String? = "lproj") -> String {
        let bundle: Bundle = bundle ?? .main
        if let path = bundle.path(forResource: Localize.currentLanguage(), ofType: type),
            let bundle = Bundle(path: path) {
            return bundle.localizedString(forKey: self, value: nil, table: tableName)
        } else if let path = bundle.path(forResource: LCLBaseBundle, ofType: type),
            let bundle = Bundle(path: path) {
            return bundle.localizedString(forKey: self, value: nil, table: tableName)
        }
        return self
    }
}
