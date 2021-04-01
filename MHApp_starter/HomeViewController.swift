//
//  HomeViewController.swift
//  MHApp_starter
//
//  Created by Yatharth Chhabra on 2/24/21.
//

/*
    TODO: This is the home screen of the app. It would be great to have some basic information about the club,
    such as contact info, college name, the logo, etc.
    
    Tips:
    - Use UILabels to display text
    - Use UIImageView to display an image
    - Be creative! Play around with settings such as colors, font sizes, and alignment
 */

// ADD ATTENDANCE LINK


import UIKit
import WebKit


class HomeViewController: UIViewController {
    // an IBOutlet to the title UILabel. Basically a
    // referencable variable for the HomeViewController class
    
    @IBOutlet weak var Instagram: UITextView!

    @IBOutlet weak var Twitter: UITextView!
    
    @IBOutlet weak var Facebook: UITextView!
    
    @IBOutlet var webView: WKWebView!
    
    @IBOutlet weak var about: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //change it to be the actual website
        let url = URL(string: "https://maizepages.umich.edu/organization/michiganhackers")!
        let request = URLRequest(url: url)
        webView.load(request)
    
        updateInstagram()
        updateTwitter()
        updateFacebook()
        
        
        /* TODO: This is here you can put code (preferably in helper methods) that will get called
                 when the home screen is about to be displayed.
        */
        
    }

    @IBAction func slack(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://app.slack.com/client/T02CF0R6B/C02CF0R6P")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func teams(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://docs.google.com/document/d/1bEi68shUVQhAKHCqJ8rS2ero0YVx8OYGkQUR1CAlVzc/edit")! as URL, options: [:], completionHandler: nil)
        
    }

    
    
    func updateInstagram(){
        let path = "https://www.instagram.com/michiganhackers/"
        let text = Instagram.text ?? ""
        let attributedString = NSAttributedString.makeHyperLink(for: path, in: text, as: "Instagram")
        let font = Instagram.font
        let frontColor = Instagram.textColor
        Instagram.attributedText = attributedString
        Instagram.font = font
        Instagram.textColor = frontColor
        Instagram.linkTextAttributes = [.foregroundColor : UIColor.blue]
    }

    func updateTwitter(){
        
        let path = "https://twitter.com/MichiganHackers"
        let text = Twitter.text ?? ""
        let attributedString = NSAttributedString.makeHyperLink(for: path, in: text, as: "Twitter")
        let font = Twitter.font
        let frontColor = Twitter.textColor
        Twitter.attributedText = attributedString
        Twitter.font = font
        Twitter.textColor = frontColor
        Twitter.linkTextAttributes = [.foregroundColor : UIColor.blue]
        
    }
    
    func updateFacebook(){
        let path = "https://www.facebook.com/michiganhackers/"
        let text = Facebook.text ?? ""
        let attributedString = NSAttributedString.makeHyperLink(for: path, in: text, as: "Facebook")
        let fontColor = Facebook.textColor
        let font = Facebook.font
        Facebook.attributedText = attributedString
        Facebook.font = font
        Facebook.textColor = fontColor
        Facebook.linkTextAttributes = [.foregroundColor : UIColor.blue]
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
