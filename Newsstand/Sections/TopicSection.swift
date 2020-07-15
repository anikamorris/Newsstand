//
//  TopicSection.swift
//  Newsstand
//
//  Created by Anika Morris on 7/15/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation
import UIKit

struct TopicSection: Section {
    var numberOfItems: Int = 0
    var topics: [String]!
    
    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.45), heightDimension: .fractionalHeight(0.3))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicCollectionViewCell.identifier, for: indexPath) as! TopicCollectionViewCell
        cell.set(topic: topics[indexPath.row])
        return cell
    }
    
    
}
