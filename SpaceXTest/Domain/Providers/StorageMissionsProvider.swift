//
//  StorageMissionsProvider.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 08/09/23.
//

import Foundation

protocol StorageMissionsProvider {
    func invoke(completion: @escaping ([Mission]) -> ())
}

final class StorageMissionsProviderImp: StorageMissionsProvider {
    func invoke(completion: @escaping ([Mission]) -> ()) {
        StorageClient.getMissions { [weak self] realmMissions in
            guard let self: StorageMissionsProviderImp = self else {
                return
            }
            completion(self.mapperToDomainModel(realmMissions: realmMissions))
        }
    }
}
extension StorageMissionsProviderImp {
    func mapperToDomainModel(realmMissions: [RealmMission]) -> [Mission] {
        return realmMissions.map { realmMision in
            var flickrImages: [String] = []
            if let images = realmMision.links?.flickrImages {
                flickrImages = Array(images)
            }
            let mission: Mission = Mission(missionName: realmMision.missionName,
                                           siteName: realmMision.launchSite?.siteName ?? "",
                                           launch: realmMision.launch,
                                           flickrImages: flickrImages,
                                           launchSite: LaunchSite(siteNameLong: realmMision.launchSite?.siteName ?? ""),
                                           rocket: Rocket(name: realmMision.rocket?.name ?? "",
                                                          type: realmMision.rocket?.type ?? ""),
                                           details: realmMision.details,
                                           links: Links(missionPatch: realmMision.links?.missionPatch ?? "",
                                                        missionPatchSmall: realmMision.links?.missionPatchSmall ?? "",
                                                        articleLink: realmMision.links?.articleLink ?? "",
                                                        youtubeId: realmMision.links?.youtubeId ?? ""))
            return mission
        }
    }
}

