//
//  InfoWebViewViewController.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 11/09/23.
//

import UIKit
import WebKit

class InfoWebViewViewController: UIViewController {

    lazy var webView: WKWebView = {
       let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    let url: String
    
    init(url: String) {
        self.url = url
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
        guard let urlLoad: URL = URL(string: self.url) else {
            return
        }
        webView.load(URLRequest(url: urlLoad))
    }
    
    private func addSubviews() {
        view.addSubview(webView)
    }
    
    private func addConstrainst() {
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.leftAnchor.constraint(equalTo: view.leftAnchor),
            webView.rightAnchor.constraint(equalTo: view.rightAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}
