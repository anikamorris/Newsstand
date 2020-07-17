//
//  HeadlineTableViewCell.swift
//  Newsstand
//
//  Created by Anika Morris on 7/16/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation
import UIKit

class HeadlineTableViewCell: UITableViewCell {
    
    static let identifier: String = "HeadlineCell"
    
    let headlineLabel = makeLabel()
    let headlineImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private static func makeLabel() -> UILabel {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.numberOfLines = 0
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
    
    private func setUpLabelsAndConstraints() {
                
        guard let palatino = UIFont(name: "Palatino", size: 18) else {
            fatalError("""
                Failed to load the "Palatino" font.
                Since this font is included with all versions of iOS that support Dynamic Type, verify that the spelling and casing is correct.
                """
            )
        }
        headlineLabel.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: palatino)
        headlineLabel.adjustsFontForContentSizeCategory = true

        contentView.addSubview(headlineLabel)
        
        headlineLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor).isActive = true
        headlineLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true
        
        contentView.layoutMarginsGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: headlineLabel.lastBaselineAnchor, multiplier: 1).isActive = true
        
        headlineLabel.firstBaselineAnchor.constraint(equalToSystemSpacingBelow: contentView.layoutMarginsGuide.topAnchor, multiplier: 1).isActive = true
    }
}
