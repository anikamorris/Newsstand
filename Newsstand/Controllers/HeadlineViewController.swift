//
//  ViewController.swift
//  Newsstand
//
//  Created by Anika Morris on 7/9/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import UIKit

class HeadlineViewController: UIViewController {
    
    var topic: String!
    var headlines: [String] = []
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = topic.capitalized
        let client = APIClient()
        client.getHeadlines(for: self.topic) { [weak self](result) in
            switch result {
            case let .success(articles):
                guard let self = self else { return }
                for article in articles {
                    if let headline = article.title {
                        self.headlines.append(headline)
                    }
                }
                print(self.headlines)
            case let .failure(error):
                print(error)
            }
        }
    }


}

