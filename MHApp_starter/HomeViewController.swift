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
import UIKit

class HomeViewController: UIViewController {
    // an IBOutlet to the title UILabel. Basically a
    // referencable variable for the HomeViewController class
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var zoomLink: UILabel!
    @IBOutlet weak var homeImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* TODO: This is here you can put code (preferably in helper methods) that will get called
                 when the home screen is about to be displayed.
        */
        
        homeImage.image = UIImage(named: "Image")
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.onClickLabel(sender:)))
        
        zoomLink.isUserInteractionEnabled = true
            zoomLink .addGestureRecognizer(tap)
        
    }
    
    @objc func onClickLabel(sender:UITapGestureRecognizer){
        openUrl(urlString: "https://umich.zoom.us/j/96226095202")
    }
    
    func openUrl(urlString:String!){
        let url = URL(string: urlString)!
        if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
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
