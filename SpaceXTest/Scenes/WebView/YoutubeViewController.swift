//
//  YoutubeViewController.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 11/09/23.
//

import UIKit
import YouTubeiOSPlayerHelper

class YoutubeViewController: UIViewController {

    lazy var youTubeView: YTPlayerView = {
        let view: YTPlayerView = YTPlayerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let youtubeID: String
    
    init(youtubeID: String) {
        self.youtubeID = youtubeID
        super.init(nibName: nil, bundle: nil)
        addSubviews()
        addConstrainst()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        youTubeView.load(withVideoId: youtubeID)
    }

    private func addSubviews() {
        view.addSubview(youTubeView)
    }
    
    private func addConstrainst() {
        NSLayoutConstraint.activate([
            youTubeView.topAnchor.constraint(equalTo: view.topAnchor),
            youTubeView.leftAnchor.constraint(equalTo: view.leftAnchor),
            youTubeView.rightAnchor.constraint(equalTo: view.rightAnchor),
            youTubeView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}
