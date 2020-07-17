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
    var articles: [Article] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(HeadlineTableViewCell.self, forCellReuseIdentifier: HeadlineTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
        self.title = topic.capitalized
        let client = APIClient()
        client.getHeadlines(for: self.topic) { result in
            switch result {
            case let .success(articles):
                for article in articles {
                    self.articles.append(article)
                }
            case let .failure(error):
                print(error)
            }
        }
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}



extension HeadlineViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HeadlineTableViewCell.identifier, for: indexPath) as! HeadlineTableViewCell
        let article = articles[indexPath.row]
        if let title = article.title {
            cell.headlineLabel.text = title
        }
        if let imageURL = article.urlToImage {
            cell.headlineImageURL = imageURL
        }
        
        return cell
    }
}

extension HeadlineViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let articleVC = ArticleViewController()
        articleVC.article = articles[indexPath.row]
        self.navigationController?.pushViewController(articleVC, animated: true)
    }
}
