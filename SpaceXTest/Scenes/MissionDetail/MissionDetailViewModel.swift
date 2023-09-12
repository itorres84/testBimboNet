//
//  MissionDetailViewModel.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 09/09/23.
//

import Foundation

final class MissionDetailViewModel {
    
    private var storageMissions: [MissionDetailSection] = [] {
        didSet {
            bindSynchronizeViewModelToController(storageMissions)
        }
    }
    
    var bindSynchronizeViewModelToController: ([MissionDetailSection]) -> () = {_ in }
    private let mission: Mission
    
    init(mission: Mission) {
        self.mission = mission
    }
    
    func getSections() {
        var sections: [MissionDetailSection] = []
        let generalInfo: GeneralInfo = GeneralInfo(date: mission.launch,
                                                   site: mission.launchSite.siteNameLong,
                                                   rocketName: mission.rocket.name,
                                                   rocketType: mission.rocket.type)
        sections.append(.generalData(info: generalInfo))
        if !mission.flickrImages.isEmpty {
            sections.append(.carrousel(images: mission.flickrImages))
        }
        sections.append(.description(info: mission.details))
        sections.append(.links(info: LinksRedirect(youtubeLink: mission.links.youtubeId,
                                                   webLink: mission.links.articleLink)))
        storageMissions = sections
    }
        
    func getTitle() -> String {
        return mission.missionName
    }
    
}

