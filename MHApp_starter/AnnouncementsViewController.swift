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

class AnnouncementsViewController: UIViewController, WKUIDelegate {

    
    var webView: WKWebView!

    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var lastSunday: Date = Date.today().previous(Date.Weekday.sunday);

        var announcementURLString = createURLStringFromDate(date: formatDate(lastSunday))
        var announcementURL = URL(string:announcementURLString)
        
        var returnCode: Int = -1
        
        let task = URLSession.shared.dataTask(with: announcementURL!) { _, response, _ in
            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse.statusCode)
                while (httpResponse.statusCode == 404){
                    
                }
            }
        }

        task.resume()
        
        let announcementURLRequest = URLRequest(url: announcementURL!)
        
        webView.load(announcementURLRequest)
        
        
    }
    
    func formatDate (_ lastSunday: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let lastSundayFormatted = dateFormatter.string(from: lastSunday)
        
        return lastSundayFormatted
    }
    
    func createURLStringFromDate(date: String) -> String{
        let baseURL = "https://michiganhackers.github.io/mh-ios-app-backend/announcements/"
        return baseURL + date
    }
}
