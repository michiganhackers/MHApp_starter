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
import EventKit
import EventKitUI
import Combine

/*class CalendarViewController: UIViewController {
    
    // an IBOutlet to the title UILabel. Basically a
    // referencable variable for the CalendarViewController class
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
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
    
}*/


enum MyTheme {
    case light
    case dark
}

class CalendarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var eventDescription: String = ""
    var events = [CalendarViewController]()
    
    @IBAction func EventAdd(_ sender: Any) {
        let alertController = UIAlertController(title: "New Event", message: "Please Enter a New Event", preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.text = ""
        }

        // 3. Grab the value from the text field
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alertController] (_) in
            let textField = alertController?.textFields![0]
            self.eventDescription = (textField?.text!)!
            //self.loadEvents(description: self.eventDescription)
        }))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    //var text: String = ""
    /*@IBAction func addEvent(_ sender: Any) {
        let alertController = UIAlertController(title: "New Event", message: "Please Enter a New Event", preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.text = ""
        }

        // 3. Grab the value from the text field
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alertController] (_) in
            let textField = alertController?.textFields![0]
            self.eventDescription = (textField?.text!)!
            self.loadEvents(description: self.eventDescription)
        }))
        
        self.present(alertController, animated: true, completion: nil)
    }*/
    /*
    private func loadEvents(description: String) {
        
        guard let event1 = CalendarViewController(eventDescription: description) else {
            fatalError("There is no event")
        }
        events += [event1]
        
        
    }*/
    init?(eventDescription: String) {
        
        guard !eventDescription.isEmpty else {
            return nil
        }
        
        self.eventDescription = eventDescription
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder decoder : NSCoder) {
        super.init(coder: decoder)
    }
    
    
    var theme = MyTheme.dark
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Calender"
        self.navigationController?.navigationBar.isTranslucent=false
        self.view.backgroundColor=Style.bgColor
        
        view.addSubview(calenderView)
        calenderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive=true
        calenderView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive=true
        calenderView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive=true
        calenderView.heightAnchor.constraint(equalToConstant: 365).isActive=true
        
        let rightBarBtn = UIBarButtonItem(title: "Light", style: .plain, target: self, action: #selector(rightBarBtnAction))
        self.navigationItem.rightBarButtonItem = rightBarBtn
        
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        calenderView.myCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    @objc func rightBarBtnAction(sender: UIBarButtonItem) {
        if theme == .dark {
            sender.title = "Dark"
            theme = .light
            Style.themeLight()
        } else {
            sender.title = "Light"
            theme = .dark
            Style.themeDark()
        }
        self.view.backgroundColor=Style.bgColor
        calenderView.changeTheme()
    }
    
    let calenderView: CalenderView = {
        let v=CalenderView(theme: MyTheme.dark)
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableview: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableview: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as? eventsTableViewCell else {
            fatalError("Couldn't connect to table cell")
        }
        /*if !events.isEmpty {
            let event = events[indexPath.row]
            cell.eventDescription.text = event.eventDescription
            return cell
        }
        else {*/
            cell.eventDescription.text = "There are no events today"
            return cell
        // }
    }
    
}


class eventsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var eventDescription: UILabel!
    
    /*@IBAction func addEvent(_ sender: Any) {
        let alertController = UIAlertController(title: "New Event", message: "Please Enter a New Event", preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.text = ""
        }

        // 3. Grab the value from the text field
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alertController] (_) in
            //let textField = alertController?.textFields![0]
            //self.eventDescription = (textField?.text!)!
            //self.loadEvents(description: self.eventDescription)
        }))
        
        //self.present(alertController, animated: true, completion: nil)
    }*/
    
}


