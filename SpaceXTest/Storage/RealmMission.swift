//
//  RealmMision.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 07/09/23.
//

import Foundation
import RealmSwift

class RealmMission: Object {
    @objc dynamic var missionName: String = ""
    @objc dynamic var launch: String = ""
    @objc dynamic var links: RealmLinks? = RealmLinks()
    @objc dynamic var launchSite: RealmLaunchSite? = RealmLaunchSite()
    @objc dynamic var rocket: RealmRocket? = RealmRocket()
    @objc dynamic var details: String = ""
}

class RealmLinks: Object {
    @objc dynamic var articleLink: String = ""
    @objc dynamic var youtubeId: String = ""
    let flickrImages = List<String>()
}

class RealmLaunchSite: Object {
    @objc dynamic var siteName: String = ""
}

class RealmRocket: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var type: String = ""
}
