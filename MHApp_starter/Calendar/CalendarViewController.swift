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
import FSCalendar

class CalendarViewController: UIViewController {
    // referencable variable for the CalendarViewController class
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var calendarView: FSCalendar!
    
    
    let primaryColor = UIColor(red: 255/255, green: 175/255, blue: 189/255, alpha: 0.25)
    let secondaryColor = UIColor(red: 255/255, green: 195/255, blue: 160/255, alpha: 1)
    
    var datesWithEvent = ["2020-4-09"]
    

    fileprivate lazy var dateFormatter2: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        //titleLabel.textColor = secondaryColor.darken(byPercentage: 0.1)
        
        setupCal()
    }
    

    func setupCal() {
        //view.addSubview(calendarView)
        calendarView.layer.cornerRadius = 20
        calendarView.appearance.headerTitleColor = secondaryColor
        calendarView.appearance.todayColor = secondaryColor
        calendarView.appearance.weekdayTextColor = secondaryColor
        calendarView.appearance.selectionColor = primaryColor
        calendarView.appearance.eventDefaultColor = secondaryColor
        calendarView.delegate = self
        calendarView.dataSource = self

    }

}

extension CalendarViewController: FSCalendarDelegate, FSCalendarDataSource {
    
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let formattedDate = dateFormatter.string(from: date)
        
        let myAlert = UIAlertController(title: "Date tapped", message: formattedDate, preferredStyle: .alert)
            
        let dismiss = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        myAlert.addAction(dismiss)
        present(myAlert, animated: true, completion: nil)
        
        
    }
    
    func calendar(calendar: FSCalendar!, hasEventForDate date: NSDate!) -> Bool {
        return true
    }
}
