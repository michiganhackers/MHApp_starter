//
//  TeamsViewController.swift
//  MHApp_starter
//
//  Created by Yatharth Chhabra on 2/24/21.
//

/*
    TODO: This is the teams info screen of the app. The goal is to showcase the different teams that we have.
          Since there are quite a few teams, it wouldn't make sense to cram all the info into one screen.
          One possible way to do this is through a UITableView, which makes a table that you can scroll through.
          A cleaner way to do this is with a UIScrollView.
          It's up to you to decide what information you want to display.
    
    Tips:
    - Check out UIScrollView or UITableView as a tool in which to display information
    - Use UILabels to display text
    - Use UIImageView to display an image
    - You may need to use constraints to pin the edges of your table and information within the table
    - Be creative! Play around with settings such as colors, font sizes, and alignment
 */

import UIKit

class TeamsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var teams: [String] = ["iOS", "Android", "Web"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = teams[indexPath.row]
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    // an IBOutlet to the title UILabel. Basically a
    // referencable variable for the TeamsViewController class
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

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
