//
//  WebViewController.swift
//  Project16-MapKit
//
//  Created by Berkin İnceoğlu on 17.11.2021.
//

import UIKit
import WebKit

class WebViewController: UIViewController,WKNavigationDelegate {
    var webView: WKWebView!
    var paramUrl = ""
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let escapedUrlStr = paramUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return  }

        let url = URL(string: escapedUrlStr)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    

}
