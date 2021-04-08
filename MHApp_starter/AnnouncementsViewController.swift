//
//  AnnouncementsViewController.swift
//  MHApp_starter
//
//  Created by Yatharth Chhabra on 2/24/21.
//

/*
    TODO: This is the announcements screen of the app. This screen should show the same
          information that you get in the weekly email, and eventually, you should be able
          to look at previous weeks' announcements too.
    
    Tips:
    - The announcements for each week can be loaded from
      https://michiganhackers.github.io/mh-ios-app-backend/announcements/<day>,
      where <day> is the Sunday when the announcements were emailed out.
      For example, the announcements for February 21-27 can be loaded from
      https://michiganhackers.github.io/mh-ios-app-backend/announcements/2021-02-21
 
    - Consider using a WKWebView to load the announcements from the above URL.
 
    - If you use a WKWebView, you might want to change its configuration so
      links that you click take you outside of the Michigan Hackers app into Safari.

    - Add buttons to let you navigate from week to week. Make sure you handle the
      case when there aren't any announcements on the website for some week!
 
    - Feel free to change the colors and style of the announcements page once you
      have it working!
 */

import UIKit
import WebKit

class AnnouncementsViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        
        let url = URL(string:
                        "https://michiganhackers.github.io/mh-ios-app-backend/announcements/2021-02-21")!
        
        let request = URLRequest(url: url)
        webView.load(request)
        // Do any additional setup after loading the view.
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        print("Navigation happened.")
        decisionHandler(.allow)
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
