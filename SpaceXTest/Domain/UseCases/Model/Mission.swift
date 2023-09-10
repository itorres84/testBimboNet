//
//  Mision.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 07/09/23.
//

import Foundation

struct Mission {
    let missionName: String
    let siteName: String
    let launch: String
    let flickrImages: [String]
    let launchSite: LaunchSite
    let rocket: Rocket
    let details: String
    let links: Links
}

struct LaunchSite {
    let siteNameLong: String
}

struct Rocket {
    let name: String
    let type: String
}

struct Links {
    let missionPatch: String
    let missionPatchSmall: String
    let articleLink: String
    let youtubeId: String
}
