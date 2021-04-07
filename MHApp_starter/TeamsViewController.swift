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
import ChameleonFramework

class TeamsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // an IBOutlet to the title UILabel. Basically a
    // referencable variable for the TeamsViewController class
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var names : [String] = ["Android", "Embedded Systems", "iOS", "Independent Hackers", "Web", "Marketing", "Open-Source Dev", "Machine Learning", "Security", "Interviewing", "Puzzles"]
    
    var links : [String] = ["https://umich.zoom.us/j/91408898920", "https://umich.zoom.us/j/6550948402", "https://umich.zoom.us/j/92355424586", "https://umich.zoom.us/j/4452592632", "https://umich.zoom.us/j/94224389748", "https://umich.zoom.us/j/2431519435", " https://umich.zoom.us/j/93661729741", "https://umich.zoom.us/j/98250214517", "https://umich.zoom.us/j/93950212720", "https://umich.zoom.us/j/99561512432", "https://umich.zoom.us/j/99965702107"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 80
        tableView.separatorStyle = .none
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "popUp", sender: self)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let destinationVC = segue.destination as! popUpScreenViewController

            if let indexPath = tableView.indexPathForSelectedRow {
                destinationVC.currName = names[indexPath.row]
                destinationVC.currLink = links[indexPath.row]
                destinationVC.backColor = UIColor(hexString: "ff9d5c")?.darken(byPercentage: CGFloat(indexPath.row) / (1.5*CGFloat(Float(names.count))))
            }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.selectionStyle = .none
        
        //set cell name per row = team in array of teams above
        if let color = UIColor(hexString: "ff9d5c")?.darken(byPercentage: CGFloat(indexPath.row) / (1.5*CGFloat(Float(names.count)))) {
            cell.backgroundColor = color
            cell.textLabel?.textColor = ContrastColorOf(color, returnFlat: true)
        }
        
        cell.textLabel?.text = names[indexPath.row]
        
        return cell
    }
    
    
}
