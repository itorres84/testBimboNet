//
//  DescriptionTableViewCell.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 11/09/23.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {

    let textDescription: UITextView = {
        let textView: UITextView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 18)
        return textView
    }()
    
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
        addSubview(textDescription)
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            textDescription.topAnchor.constraint(equalTo: topAnchor),
            textDescription.rightAnchor.constraint(equalTo: rightAnchor),
            textDescription.leftAnchor.constraint(equalTo: leftAnchor),
            textDescription.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(description: String) {
        textDescription.text = description
    }
    
}
