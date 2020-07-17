//
//  ArticleViewController.swift
//  Newsstand
//
//  Created by Anika Morris on 7/14/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class ArticleViewController: UIViewController, WKUIDelegate {
    var article: Article!
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.article.title
        guard let url = self.article.url else { return }
        guard let articleURL = URL(string: url) else { return }
        let request = URLRequest(url: articleURL)
        webView.load(request)
    }
}
