//
//  MissionResponseModel.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 07/09/23.
//

import Foundation

struct MissionResponseModel: Codable {
    let missionName: String
    let launch: String
    let links: LinksResponseModel
    let launchSite: LaunchSiteResponseModel
    let rocket: RocketResponseModel
    let details: String?
    
    enum CodingKeys: String, CodingKey {
        case missionName = "mission_name"
        case launch = "launch_date_utc"
        case details
        case links
        case launchSite = "launch_site"
        case rocket
    }
}

struct LinksResponseModel: Codable {
    let articleLink: String?
    let youtubeId: String
    let flickrImages: [String]?
    
    enum CodingKeys: String, CodingKey {
        case articleLink = "article_link"
        case youtubeId = "youtube_id"
        case flickrImages = "flickr_images"
    }
}

struct LaunchSiteResponseModel: Codable {
    let siteName: String
        
    enum CodingKeys: String, CodingKey {
        case siteName = "site_name_long"
    }
}

struct RocketResponseModel: Codable {
    let name: String
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case name = "rocket_name"
        case type = "rocket_type"
    }
}
