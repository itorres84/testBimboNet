//
//  LinksTableViewCell.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 11/09/23.
//

import UIKit

protocol LinksTableViewCellDelegate: AnyObject {
    func openWebView(url: String)
    func openYoutube(youTubeID: String)
}

class LinksTableViewCell: UITableViewCell {
    
    lazy var stackView: UIStackView = {
        let stack: UIStackView = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        stack.backgroundColor = .white
        return stack
    }()
    
    weak var delegate: LinksTableViewCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        addSubviews()
        addConstraints()
    }
   
    private func addSubviews() {
        contentView.addSubview(stackView)
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(link: LinksRedirect) {
        let linkYoutube = LinkButtonView(option: .youtube(link: link.youtubeLink))
        linkYoutube.delegate = self
        stackView.addArrangedSubview(linkYoutube)
        let linkWeb = LinkButtonView(option: .web(link: link.webLink))
        linkWeb.delegate = self
        stackView.addArrangedSubview(linkWeb)
    }
}

extension LinksTableViewCell: LinkButtonViewDelegate {
    func tapButton(option: LinkButtonOption) {
        switch option {
        case .web(let link):
            delegate?.openWebView(url: link)
        case .youtube(let link):
            delegate?.openYoutube(youTubeID: link)
        }
    }
}
