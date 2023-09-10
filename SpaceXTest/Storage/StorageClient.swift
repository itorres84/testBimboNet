//
//  StorageClient.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 07/09/23.
//

import Foundation
import RealmSwift

final class StorageClient {
    
    static func saveMissions(missions: [MissionResponseModel], completion: @escaping () -> ()) {
        for mission: MissionResponseModel in missions {
            let realmMission: RealmMission = RealmMission()
            realmMission.missionName = mission.missionName
            realmMission.launch = mission.launch
            realmMission.links = RealmLinks()
            realmMission.links?.articleLink = mission.links.articleLink ?? ""
            realmMission.links?.youtubeId = mission.links.youtubeId
            realmMission.links?.missionPatch = mission.links.missionPatch ?? ""
            realmMission.links?.missionPatchSmall = mission.links.missionPatchSmall ?? ""
            if let images: [String] = mission.links.flickrImages {
                realmMission.links?.flickrImages.append(objectsIn: images)
            }
            realmMission.launchSite = RealmLaunchSite()
            realmMission.launchSite?.siteName = mission.launchSite.siteName
            realmMission.rocket = RealmRocket()
            realmMission.rocket?.name = mission.rocket.name
            realmMission.rocket?.type = mission.rocket.type
            realmMission.details = mission.details ?? ""
            do {
                let realm: Realm = try Realm()
                try realm.write({
                    realm.add(realmMission)
                })
            } catch {
                debugPrint("Failed save mission on realm: \(error.localizedDescription)")
            }
        }
        completion()
    }
    
    static func getMissions(completion: @escaping ([RealmMission]) -> ()) {
        do {
            let realm: Realm = try Realm()
            completion(Array(realm.objects(RealmMission.self)))
        } catch {
            debugPrint("Failed get missions of realm: \(error.localizedDescription)")
        }
    }
    
}
