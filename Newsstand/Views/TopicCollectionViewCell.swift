//
//  TopicCollectionViewCell.swift
//  Newsstand
//
//  Created by Anika Morris on 7/15/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import UIKit

class TopicCollectionViewCell: UICollectionViewCell {

    static var identifier: String = "TopicCell"

    let topicLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .cyan
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        setUpCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpCell() {
        contentView.addSubview(topicLabel)
        NSLayoutConstraint.activate([
            topicLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            topicLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            topicLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            topicLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
    
    func set(topic: String) {
        topicLabel.text = topic
    }

}
