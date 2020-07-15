//
//  TopicsViewController.swift
//  Newsstand
//
//  Created by Anika Morris on 7/14/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation
import UIKit

protocol Section {
    var numberOfItems: Int { get }
    func layoutSection() -> NSCollectionLayoutSection
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
}

class TopicsViewController: UIViewController {
    var collectionView: UICollectionView!
    var sections: [Section] = []
    let topics: [String] = ["business", "politics", "health", "science", "tech", "sports", "entertainment"]
}

extension TopicsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

extension TopicsViewController: UICollectionViewDelegate {}
