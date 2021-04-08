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
import SwiftUI
import Foundation

class AnnouncementsViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!

    func createFormatter() -> String {
        var components = DateComponents()
        let date = Date()
        let cal = Calendar.current
        let weekdayIndex = cal.component(.weekday, from: date)
        let year = cal.component(.year, from: date)
        let month = cal.component(.month, from: date)
        var day = cal.component(.day, from: date)
        
        //if let weekdayName = DateFormatter().weekdaySymbols?[ weekdayIndex - 1] {
            //print(weekdayIndex)
        //print(weekdayIndex)
            if(weekdayIndex == 2) {
                day = day - 1
            }
            else if(weekdayIndex == 3) {
                day = day - 2
            }
            else if(weekdayIndex == 4) {
                day = day - 3
            }
            else if(weekdayIndex == 5) {
                day = day - 4
            }
            else if(weekdayIndex == 6) {
                day = day - 5
            }
            else if(weekdayIndex == 7) {
                day = day - 6
            }
            else if(weekdayIndex == 0) {
                day = day + 1
            }
        
        components.day = day
        components.month = month
        components.year = year
                
        let realDate: Date? = cal.date(from: components)
       // }
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.ReferenceType.local
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date_string = dateFormatter.string(from: realDate ?? date)
        //print(date_string)
        return date_string
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let url = URL(string: "https://michiganhackers.github.io/mh-ios-app-backend/announcements/" + createFormatter())!
        
        
        let request = URLRequest(url: url)
        
        webView.load(request)
        
        
        // Do any additional setup after loading the view.
        
        
        
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

