//
//  DetailViewController.swift
//  Project7-JSON
//
//  Created by Berkin İnceoğlu on 20.10.2021.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView : WKWebView!
    var detailItem : Petition?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let detailItem = detailItem else { return }
        
        let html = """
        <!DOCTYPE html>
        <html lang="en">
            <head>
                <meta charset="utf-8" />
                <style type="text/css">
                    body{
                        font-family:"Helvetica Neue UltraLight",helvetica,verdana;
                        margin-left:0;
                        margin-right:0;
                    }
                    section{
                        padding-left:5px;
                        padding-right:5px;
                        font-size:45px;
                    }
                    h1{
                        font-size: 65px;
                        padding-left:5px;
                    }

                </style>
            </head>
            <body>
               <h1>\(detailItem.title)</h1>
               <section>
                    <p>\(detailItem.body)</p>
               </section>
            </body>
        </html>
        """
        
        webView.loadHTMLString(html, baseURL: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
