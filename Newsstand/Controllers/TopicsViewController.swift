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
    var sections: [Section] = [TitleSection.init(title: "Newsstand")]
    let topics: [String] = ["business", "politics", "health", "science", "tech", "sports", "entertainment"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    func setUpTopicSection() {
        var topicSection = TopicSection()
        topicSection.numberOfItems = topics.count
        topicSection.topics = self.topics
        self.sections.append(topicSection)
        print(self.sections)
    }
    
    func setupCollectionView() {
        setUpTopicSection()
        
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            return self.sections[sectionIndex].layoutSection()
        }
        collectionView = UICollectionView(frame: view.safeAreaLayoutGuide.layoutFrame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white
        collectionView.register(TopicCollectionViewCell.self, forCellWithReuseIdentifier: TopicCollectionViewCell.identifier)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        self.view.addSubview(collectionView)
    }
}

extension TopicsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].numberOfItems
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return sections[indexPath.section].configureCell(collectionView: collectionView, indexPath: indexPath)
    }
}

extension TopicsViewController: UICollectionViewDelegate {}
