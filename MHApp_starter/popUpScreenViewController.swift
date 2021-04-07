//
//  popUpScreenViewController.swift
//  MHApp_starter
//
//  Created by Drew Scheffer on 4/7/21.
//

import UIKit
import ChameleonFramework

class popUpScreenViewController: UIViewController {
    
    var currLink : String!
    var currName : String!
    var backColor : UIColor!
    var textColor = UIColor.white
    
    
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var rand: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = backColor
        textView.backgroundColor = backColor
        
        textColor = ContrastColorOf(backColor, returnFlat: true)
        teamNameLabel.textColor = textColor
        rand.textColor = textColor
        
        
        teamNameLabel.text = currName + " Team"        
        updateTextView()
    }
    
    func updateTextView() {
        let path = currLink!
        textView.text = currLink
        let text = textView.text ?? ""
        let attributedString = NSAttributedString.makeHyperlink(for: path, in: text, as: text)
        let font = textView.font
        let alignment = textView.textAlignment
        textView.attributedText = attributedString
        textView.linkTextAttributes = [NSAttributedString.Key.foregroundColor: textColor,
                                       NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        textView.textAlignment = alignment
        textView.font = font
        textView.textColor = textColor
    }

}
