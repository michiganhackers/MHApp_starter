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
    @IBOutlet weak var Logo: UIImageView!
   
    @IBOutlet var mainText: UITextView!
    
    @IBOutlet var zoomLink: UITextView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTextView()
        /* TODO: This is here you can put code (preferably in helper methods) that will get called
                 when the home screen is about to be displayed.
        */
        
    }
    
    func updateTextView() {
        let path = "http://3xut.mj.am/lnk/AUsAACZ1djsAAcuk_9gAAQuG_coAAAAAAAIAAAABAAO6UQBgTohB1hQvU-yoTaO3PgQVt-h8aQADkDw/5/q-_moJM3ZyuM2rNH42H8Ew/aHR0cHM6Ly91bWljaC56b29tLnVzL2ovOTYyMjYwOTUyMDI"
        let text = zoomLink.text ?? ""
        let attributedString = NSAttributedString.makeHyperlink(for: path, in: text, as: "7:00 - 8:30 PM")
        let font = zoomLink.font
        let textColor = zoomLink.textColor
        let alignment = zoomLink.textAlignment
        zoomLink.attributedText = attributedString
        zoomLink.font = font
        zoomLink.textColor = textColor
        zoomLink.textAlignment = alignment
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
