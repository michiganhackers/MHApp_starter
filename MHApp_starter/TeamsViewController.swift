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
    // an IBOutlet to the title UILabel. Basically a
    // referencable variable for the TeamsViewController class
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.rowHeight = 100
        tableView.delegate = self
        tableView.dataSource = self
        
        loadTeams()
    }
    
    var name: String = ""
    var photo: UIImage?
    var teamDescription: String = ""
    var teams = [TeamsViewController]()
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func loadTeams() {
        
        let photo1 = UIImage(named: "team1")!
        let photo2 = UIImage(named: "team2")!
        let photo3 = UIImage(named: "team3")!
        let photo4 = UIImage(named: "team4")!
        let photo5 = UIImage(named: "team5")!
        //let photo6 = UIImage(named: "team6")!
        //let photo7 = UIImage(named: "team7")!
        let photo8 = UIImage(named: "team8")!
        let photo9 = UIImage(named: "team9")!
        let photo10 = UIImage(named: "team10")!
        let photo11 = UIImage(named: "team11")!
        let photo12 = UIImage(named: "team12")!
        let photo13 = UIImage(named: "team13")!
        
        guard let team1 = TeamsViewController(name: "IOS team", photo: photo1, teamDescription: "This is the best team ever and is working on a Michigan hackers app") else {
            fatalError("This Failed Miserably for some weird reson")
        }
        guard let team2 = TeamsViewController(name: "Machine Learning", photo: photo2, teamDescription: "Learn the fundamentals of Machine Learning including the mathematics behind it and applications through using python with ML libraries to collaborate on projects") else {
            fatalError("This Failed Miserably for some weird reson")
        }
        guard let team7 = TeamsViewController(name: "Web", photo: photo3, teamDescription: "Learn about web technologies including frontend, backend, and various frameworks through designing an intuitive, fast, and modern website that works on multiple platforms") else {
            fatalError("This Failed Miserably for some weird reson")
        }
        guard let team4 = TeamsViewController(name: "Security", photo: photo5, teamDescription: "Learn about the inctricacies of computer security and prepare for a career in the field through building security challenges and participating in Capture The Flag competitions") else {
            fatalError("This Failed Miserably for some weird reson")
        }
        guard let team5 = TeamsViewController(name: "Interviewing", photo: photo12, teamDescription: "Prepare for company-specific technical interviews through learning and exploring new data structures and algorithms and participating in programming competitions") else {
            fatalError("This Failed Miserably for some weird reson")
        }
        guard let team6 = TeamsViewController(name: "Puzzles", photo: photo11, teamDescription: "Collaborate as a team to develop problem solving and critical thinking skills through working with puzzles") else {
            fatalError("This Failed Miserably for some weird reson")
        }
        guard let team3 = TeamsViewController(name: "Android", photo: photo4, teamDescription: "Utilize Java, Git, and Android Studio to create an Android app and deploy it to the Google Play Store") else {
            fatalError("This Failed Miserably for some weird reson")
        }
        guard let team8 = TeamsViewController(name: "Open-Source Development", photo: photo9, teamDescription: "Gain experience using new programming languages in a real-world context by contributing to open-source projects") else {
            fatalError("This Failed Miserably for some weird reson")
        }
        guard let team9 = TeamsViewController(name: "Embedded Systems", photo: photo10, teamDescription: "Learn about Python, C++, hardware/software interactions, and industry protocls through building bare-bones systems using single-board computers ") else {
            fatalError("This failed miserably for some weird reason")
        }
        guard let team10 = TeamsViewController(name: "Independent Hackers", photo: photo13, teamDescription: "Work on interesting side projects to boost one's resume independently or with members of the team") else {
            fatalError("This failed miserably for some weird reason")
        }
        guard let team11 = TeamsViewController(name: "Marketing", photo: photo8, teamDescription: "Create a beautiful yet informative design in the form of posters, banner, graphics, and more to promote our large hacking community") else {
            fatalError("This failed miserably for some weird reason")
        }
        teams += [team1, team2, team3, team4, team5, team6, team7, team8, team9, team10, team11]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
        
    func tableView(_ tableview: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
        
    func tableView(_ tableview: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as? teamsTableViewCell else {
            fatalError("Not a good thing to do")
        }
            
        let team = teams[indexPath.row]
        cell.teamName.text = team.name
        cell.aboutTeam.text = team.teamDescription
        cell.teamImage.image = team.photo
        return cell
    }
      
    
    init?(name: String, photo: UIImage, teamDescription: String) {
        
        guard !name.isEmpty else {
            return nil
        }
        self.name = name
        self.teamDescription = teamDescription
        self.photo = photo
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder decoder : NSCoder) {
        super.init(coder: decoder)
    }
    
    
}



class teamsTableViewCell: UITableViewCell {
    //@IBOutlet weak var teamImage: UIImageView!
    //@IBOutlet weak var teamName: UILabel!
    //@IBOutlet weak var aboutTeam: UILabel!
    
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    
    @IBOutlet weak var aboutTeam: UILabel!
    
}
