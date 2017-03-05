//
//  addEventViewController.swift
//  Mathilda
//
//  Created by Yang on 13/11/2016.
//  Copyright © 2016 Mathilda. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate, UITextFieldDelegate {
  let rowsInSection = [0:2, 1:4, 2:5, 3:2]
  
  @IBOutlet weak var eventView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
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
      let eventInfo = UITextField(frame: CGRect(x: 15.0, y: 0.0, width: 245.0, height: 44.0))
      eventInfo.delegate = self
//      eventInfo.adjustsFontSizeToFitWidth = true
//      eventInfo.contentVerticalAlignment = UIControlContentVerticalAlignment.center
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
        let timeZone = UILabel(frame: CGRect(x: 360 - 100, y: 0, width: 100, height: 44))
        timeZone.textColor = UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)
        timeZone.text = "Shanghai"
        cellView.addSubview(timeZone)
        let chooseDetail = UIButton(frame: CGRect(x: 360 - 20, y: cellView.frame.midY - 20 / 2, width: 40 * 366 / 652, height:20))
        chooseDetail.setImage(#imageLiteral(resourceName: "more"), for: .normal)
        cellView.addSubview(chooseDetail)
      default:
        print("error: TableViewCellSection 2 has an undefined row")
      }
      cellView.addSubview(eventInfo)
    case 2:
      let eventInfo = UILabel(frame: CGRect(x: 15.0, y: 0.0, width: 345.0, height: 44.0))
      let chooseDetail = UIButton(frame: CGRect(x: 360-20, y: cellView.frame.midY - 20 / 2, width: 40 * 366 / 652, height:20))
      chooseDetail.setImage(#imageLiteral(resourceName: "more"), for: .normal)
      cellView.addSubview(chooseDetail)
      //chooseDetail.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControlEvents#>)
      switch indexPath.row {
      case 0:
        eventInfo.text = "Repeat"
        let repeatInfo = UILabel(frame: CGRect(x: 360 - 75, y: 0, width: 75, height: 44))
        repeatInfo.textColor = UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)
        repeatInfo.text = "Never"
        cellView.addSubview(repeatInfo)
      case 1:
        eventInfo.text = "Invitees"
        let inviteesInfo = UILabel(frame: CGRect(x: 360 - 70, y: 0, width: 70, height: 44))
        inviteesInfo.textColor = UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)
        inviteesInfo.text = "None"
        cellView.addSubview(inviteesInfo)
      case 2:
        eventInfo.text = "Alert"
        let alertInfo = UILabel(frame: CGRect(x: 360 - 150, y: 0, width: 150, height: 44))
        alertInfo.textColor = UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)
        alertInfo.text = "At time of event"
        cellView.addSubview(alertInfo)
      case 3:
        eventInfo.text = "Calendar"
        let calenderInfo = UILabel(frame: CGRect(x: 360 - 75, y: 0, width: 75, height: 44))
        calenderInfo.textColor = UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)
        calenderInfo.text = "Usual"
        cellView.addSubview(calenderInfo)
      case 4:
        eventInfo.text = "Show As"
        let showAsInfo = UILabel(frame: CGRect(x: 360 - 70, y: 0, width: 70, height: 44))
        showAsInfo.textColor = UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)
        showAsInfo.text = "Busy"
        cellView.addSubview(showAsInfo)
      default:
        print("error: TableViewCellSection 3 has an undefined row")
      }
      cellView.addSubview(eventInfo)
    case 3:
      switch indexPath.row {
      case 0:
        let eventInfo = UITextField(frame: CGRect(x: 20.0, y: 0.0, width: 345.0, height: 44.0))
        eventInfo.placeholder = "URL"
        eventInfo.delegate = self
        cellView.addSubview(eventInfo)
      case 1:
        let eventInfo = UITextView(frame: CGRect(x: 15, y: 0, width: 345, height: 44))
        eventInfo.delegate = self
        eventInfo.text = "Notes"
        eventInfo.font = UIFont(name: ".SFUIText", size: 17)
        eventInfo.textColor = UIColor.lightGray
        cellView.addSubview(eventInfo)
      default:
        print("error: TableViewCellSection 4 has an undefined row")
      }
    default:
      print("error: TableView has an undefined section")
    }
    
    cell?.contentView.addSubview(cellView)
    return cell!
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch indexPath.section {
    case 0:
      switch indexPath.row {
      case 1:
        self.performSegue(withIdentifier: "showEventDetail", sender: nil)
      default:
        print("case0")
      }
    default:
      print("case!0")
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showEventDetail" {
      let controller = segue.destination as! addEventDetail
      // controller.?? = sender as? ??
    }
  }
  
  
  func textViewDidBeginEditing(_ textView: UITextView) {
    if textView.textColor == UIColor.lightGray {
      textView.text = nil
      textView.textColor = UIColor.black
    }
  }
  
  func textViewDidEndEditing(_ textView: UITextView) {
    if textView.text.isEmpty {
      textView.text = "Notes"
      textView.textColor = UIColor.lightGray
    }
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 4
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return rowsInSection[section]!
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  @IBAction func cancel(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
  
  @IBAction func done(_ sender: UIBarButtonItem) {
    self.dismiss(animated: true, completion: nil)
  }
}
