//
//  TitleSection.swift
//  Newsstand
//
//  Created by Anika Morris on 7/15/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation
import UIKit

struct TitleSection: Section {
    let numberOfItems = 1
    let title: String

    init(title: String) {
        self.title = title
    }
    
    func layoutSection() -> NSCollectionLayoutSection {
        // Step 1:
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        // Step 2:
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Step 3:
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(70))
        
        // Step 4:
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Step 5:
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as! TitleCollectionViewCell
        cell.set(title: title)
        return cell
    }
}
