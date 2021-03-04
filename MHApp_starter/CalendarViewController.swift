//
//  CalendarViewController.swift
//  MHApp_starter
//
//  Created by Yatharth Chhabra on 2/24/21.
//

/*
    TODO: This is the calendar screen of the app. iOS does not have a native calendar framework. This means that
          we're going to have to use a 3rd party framework or create a custom calendar. More info on this later!
    
    Tips:
    - Use UITableView if you decide to create a list calendar
    - Use UILabels to display text
    - You may need to use constraints to pin the edges of your table and information within the table
    - Be creative! Play around with settings such as colors, font sizes, and alignment
 */

import UIKit

class CalendarViewController: UIViewController {
    // an IBOutlet to the title UILabel. Basically a
    // referencable variable for the CalendarViewController class
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //JACOBS NEW COMMENT TESTING GIT

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
