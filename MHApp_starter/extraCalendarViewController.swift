//
//  extraCalendarViewController.swift
//  MHApp_starter
//
//  Created by Joe Wentzel on 4/8/21.
//

import UIKit

class extraCalendarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var Calendar: UILabel!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 75
        tableView.delegate = self
        tableView.dataSource = self
        
        loadEvents()
    }
    
    
    var dateString: String = ""
    var eventDescription: String = ""
    var events = [extraCalendarViewController]()
    
    
    private func loadEvents() {
        
        let date  = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let yearString = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "MM"
        let MonthString = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "dd"
        let dayString = dateFormatter.string(from: date)
        let event1String = "Hack Night " + MonthString + "/" + dayString + "/" + yearString
        let event2String = "Hack Night " + MonthString + "/" + "15" + "/" + yearString
        let event3String = "Hack Night " + MonthString + "/" + "22" + "/" + yearString
        guard let event1 = extraCalendarViewController(dateString: event1String , eventDescription: "Join this meeting for all Michigan Hackers via zoom with the ID: 96226095202") else {
            fatalError("This failed")
        }
        guard let event2 = extraCalendarViewController(dateString: event2String, eventDescription: "Join this meeting for all Michigan Hackers via zoom with the ID: 96226095202") else {
            fatalError("This failed")
        }
        guard let event3 = extraCalendarViewController(dateString: event3String, eventDescription: "Join this meeting for all Michigan Hackers via zoom with the ID: 96226095202") else {
            fatalError("This failed")
        }
        
        events += [event1, event2, event3]
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return events.count
    }
    func tableView(_ tableview: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? extraCalendarTableViewCell else {
            fatalError("Not good")
        }
        
        let event = events[indexPath.row]
        cell.eventTitle.text = event.dateString
        cell.des.text = event.eventDescription
        
        return cell
    }
    
    
    init?(dateString: String, eventDescription: String) {
        
        guard !dateString.isEmpty else {
            return nil
        }
        self.dateString = dateString
        self.eventDescription = eventDescription
        
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder decoder : NSCoder) {
        super.init(coder: decoder)
    }
}


class extraCalendarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var eventTitle: UILabel!
    
    @IBOutlet weak var des: UILabel!
    
    
}
