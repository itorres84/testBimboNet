//
//  MissionDetailSection.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 09/09/23.
//

import Foundation

enum MissionDetailSection {
    case generalData(info: GeneralInfo)
    case carrousel(images: [String])
    case description(info: String)
    case links(info: LinksRedirect)
}

struct GeneralInfo {
    let date: String
    let site: String
    let rocketName: String
    let rocketType: String
}

struct LinksRedirect {
    let youtubeLink: String
    let webLink: String
}


