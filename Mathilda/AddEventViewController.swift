//
//  addEventViewController.swift
//  Mathilda
//
//  Created by Yang on 13/11/2016.
//  Copyright © 2016 Mathilda. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let rowsInSection = [0:2, 1:4, 2:5, 3:2]
    
    @IBOutlet weak var eventView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
//    func dateChanged(datePicker : UIDatePicker){
//        //更新提醒时间文本框
//        let formatter = DateFormatter()
//        //日期样式
//        formatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
//        print(formatter.string(from: datePicker.date))
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        }
        for view in (cell?.contentView.subviews)! {
            view.removeFromSuperview()
        }
        let cellView = UIView(frame: (cell?.bounds)!)
        
        switch indexPath.section {
        case 0:
            let eventInfo = UITextField(frame: CGRect(x: 15.0, y: 0.0, width: 345.0, height: 44.0))
//            eventInfo.adjustsFontSizeToFitWidth = true
//            eventInfo.contentVerticalAlignment = UIControlContentVerticalAlignment.center
            switch indexPath.row {
            case 0:
                eventInfo.placeholder = "Title"
            case 1:
                eventInfo.placeholder = "Location"
                let iconView = UIImageView(image: #imageLiteral(resourceName: "locate"))
                iconView.frame = CGRect(x: 360 - 25 * 31 / 40, y: cellView.frame.midY - 25 / 2, width: 25 * 31 / 40, height: 25)
                cellView.addSubview(iconView)
            default:
                print("error: TableViewCellSection 1 has an undefined row")
            }
            cellView.addSubview(eventInfo)
        case 1:
            let eventInfo = UILabel(frame: CGRect(x: 15.0, y: 0.0, width: 345.0, height: 44.0))
            switch indexPath.row {
            case 0:
                eventInfo.text = "All_Day"
                let allDaySwitch = UISwitch(frame: CGRect(x: 360 - 51, y: cellView.frame.midY - 31 / 2, width: 51, height: 31))
                cellView.addSubview(allDaySwitch)
            case 1:
                eventInfo.text = "Starts"
                let startTime = UIDatePicker(frame: CGRect(x: 360 - 320, y: 0, width: 320, height: 216))
//                startTime.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
                startTime.datePickerMode = .dateAndTime
                cellView.addSubview(startTime)
            case 2:
                eventInfo.text = "Ends"
            case 3:
                eventInfo.text = "Time Zone"
                let timeZone = UILabel(frame: CGRect(x: 360-100, y: 0, width: 100, height: 44))
                timeZone.textColor = UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)
                timeZone.text = "Shanghai"
                print(timeZone.frame)
                cellView.addSubview(timeZone)
            default:
                print("error: TableViewCellSection 2 has an undefined row")
            }
            cellView.addSubview(eventInfo)
        case 2:
            let eventInfo = UILabel(frame: CGRect(x: 15.0, y: 0.0, width: 345.0, height: 44.0))
            switch indexPath.row {
            case 0:
                eventInfo.text = "Repeat"
            case 1:
                eventInfo.text = "Invitees"
            case 2:
                eventInfo.text = "Alert"
            case 3:
                eventInfo.text = "Calendar"
            case 4:
                eventInfo.text = "Show As"
            default:
                print("error: TableViewCellSection 3 has an undefined row")
            }
            cellView.addSubview(eventInfo)
        case 3:
            let eventInfo = UITextField(frame: CGRect(x: 15.0, y: 0.0, width: 345.0, height: 44.0))
            switch indexPath.row {
            case 0:
                eventInfo.placeholder = "URL"
            case 1:
                eventInfo.placeholder = "Notes"
            default:
                print("error: TableViewCellSection 4 has an undefined row")
            }
            cellView.addSubview(eventInfo)
        default:
            print("error: TableView has an undefined section")
        }

        cell?.contentView.addSubview(cellView)
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsInSection[section]!
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func done(_ sender: UIBarButtonItem) {
        
        self.dismiss(animated: true, completion: nil)
    }
}
