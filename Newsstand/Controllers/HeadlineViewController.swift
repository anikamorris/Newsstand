//
//  ViewController.swift
//  Newsstand
//
//  Created by Anika Morris on 7/9/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import UIKit

class HeadlineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        APIClient.shared.getTopHeadlines { (result) in
            switch result {
            case let .success(articles):
                print(articles)
            case let .failure(error):
                print(error)
            }
        }
    }


}

