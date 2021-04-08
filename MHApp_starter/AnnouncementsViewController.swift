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

extension URL {
    func isReachable(completion: @escaping (Bool) -> ()) {
        var request = URLRequest(url: self)
        request.httpMethod = "HEAD"
        URLSession.shared.dataTask(with: request) { _, response, _ in
            completion((response as? HTTPURLResponse)?.statusCode == 200)
        }.resume()
    }
}

class AnnouncementsViewController: UIViewController, WKUIDelegate {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
    @IBOutlet weak var webView: WKWebView!
    
    func getSunday(myDate: Date) -> Date {
        let cal = Calendar.current
        var comps = cal.dateComponents([.weekOfYear, .yearForWeekOfYear], from: myDate)
        comps.weekday=1
        let sundayInWeek = cal.date(from: comps)!
        return sundayInWeek
    }
    
//    @IBOutlet weak var myButton: UIButton!
//
//    @IBAction func buttonPressed(_ sender: UIButton) {
//        let string = "https://google.com"
//        let myURL = URL(string:string)
//        let myRequest = URLRequest(url: myURL!)
//        webView.load(myRequest)
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        let now = Date()
        let sunday = getSunday(myDate: now)
        print(sunday)
        print(df.string(from: sunday))
        let lastweek = Calendar.current.date(byAdding: .weekOfYear, value: -1, to: sunday)!
        print(df.string(from: lastweek))
        var string = "https://michiganhackers.github.io/mh-ios-app-backend/announcements/"
        string = string + df.string(from: sunday)
        print(string)
        let url1 = URL(string: string)!
        url1.isReachable { success in
            if success {
                print("url1 is reachable")  // url1 is reachable
            } else {
                string = "https://michiganhackers.github.io/mh-ios-app-backend/announcements/"
                string = string + df.string(from: lastweek)
                let myURL = URL(string:string)
                let myRequest = URLRequest(url: myURL!)
                self.webView.load(myRequest)
                print("url1 is unreachable")
            }
        }
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
