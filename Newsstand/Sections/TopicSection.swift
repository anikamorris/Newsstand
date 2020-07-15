//
//  TopicSection.swift
//  Newsstand
//
//  Created by Anika Morris on 7/15/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation
import UIKit

protocol Section {
    var numberOfItems: Int { get }
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
}

struct TopicSection: Section {
    var numberOfItems: Int = 7
    var topics: [String] = ["business", "politics", "health", "science", "tech", "sports", "entertainment"]
    
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicCollectionViewCell.identifier, for: indexPath) as! TopicCollectionViewCell
        cell.set(topic: topics[indexPath.row])
        return cell
    }
    
    
}
