//
//  TopicsViewController.swift
//  Newsstand
//
//  Created by Anika Morris on 7/14/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation
import UIKit

class TopicsViewController: UIViewController {
    var collectionView: UICollectionView!
    var sections: [Section] = []
    var topics: [String] = ["business", "politics", "health", "science", "tech", "sports", "entertainment"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    
    func setupCollectionView() {
        self.sections.append(TopicSection())
        
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: view.safeAreaLayoutGuide.layoutFrame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white
        collectionView.register(TopicCollectionViewCell.self, forCellWithReuseIdentifier: TopicCollectionViewCell.identifier)
        
        self.view.addSubview(collectionView)
        self.setCollectionViewConstraints(collectionView: collectionView)
    }
    
    func setCollectionViewConstraints(collectionView: UICollectionView) {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view!.safeAreaLayoutGuide.topAnchor, constant: 12),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension TopicsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].numberOfItems
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        print(sections.count)
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let section = sections[indexPath.section] as! TopicSection
        return section.configureCell(collectionView: collectionView, indexPath: indexPath)

    }

}

extension TopicsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let headlineVC = HeadlineViewController()
        headlineVC.topic = self.topics[indexPath.row]
        self.navigationController?.pushViewController(headlineVC, animated: true)
    }
}

extension TopicsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let layout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (layout?.minimumInteritemSpacing ?? 0.0) + (layout?.sectionInset.left ?? 0.0) + (layout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (collectionView.frame.size.width - space) / 2.0
        return CGSize(width: size, height: size)
    }
}
