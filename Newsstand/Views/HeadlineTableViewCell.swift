//
//  HeadlineTableViewCell.swift
//  Newsstand
//
//  Created by Anika Morris on 7/16/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class HeadlineTableViewCell: UITableViewCell {
    
    static let identifier: String = "HeadlineCell"
    var headlineImageURL: String? = nil {
        didSet {
            addImage()
        }
    }
    
    let headlineLabel = makeLabel()
    let headlineImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private static func makeLabel() -> UILabel {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.numberOfLines = 0
        
        guard let palatino = UIFont(name: "Palatino", size: 18) else {
            fatalError("""
                Failed to load the "Palatino" font.
                Since this font is included with all versions of iOS that support Dynamic Type, verify that the spelling and casing is correct.
                """
            )
        }
        label.text = "Loading..."
        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: palatino)
        label.adjustsFontForContentSizeCategory = true
        return label
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpLabelsAndConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpLabelsAndConstraints()
    }
    
    private func addImage() {
        guard let imageURL = self.headlineImageURL else { return }
        headlineImageView.kf.setImage(with: URL(string: imageURL))
        contentView.addSubview(headlineImageView)
        NSLayoutConstraint.deactivate([
            headlineLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            contentView.layoutMarginsGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: headlineLabel.lastBaselineAnchor, multiplier: 1)
        ])
        NSLayoutConstraint.activate([
            
            headlineImageView.heightAnchor.constraint(equalToConstant: 120),
            headlineImageView.widthAnchor.constraint(equalToConstant: 120),
            headlineImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            headlineImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            contentView.layoutMarginsGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: headlineImageView.lastBaselineAnchor, multiplier: 1),
            
            headlineLabel.trailingAnchor.constraint(equalTo: headlineImageView.leadingAnchor, constant: -20)
        ])
    }
    
    private func setUpLabelsAndConstraints() {
        contentView.addSubview(headlineLabel)
        
        headlineLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor).isActive = true
        headlineLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true
        
        contentView.layoutMarginsGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: headlineLabel.lastBaselineAnchor, multiplier: 1).isActive = true
        
        headlineLabel.firstBaselineAnchor.constraint(equalToSystemSpacingBelow: contentView.layoutMarginsGuide.topAnchor, multiplier: 1).isActive = true
    }
}
