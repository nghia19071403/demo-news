//
//  WedViewController.swift
//  API news
//
//  Created by hoàng trọng nghĩa on 15/06/2022.
//

import UIKit
import WebKit

class WedViewController: UIViewController, WKNavigationDelegate {
    var url: URL? = nil
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: url!))
    }
}
