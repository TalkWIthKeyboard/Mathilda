//
//  addEventViewController.swift
//  Mathilda
//
//  Created by Yang on 13/11/2016.
//  Copyright © 2016 Mathilda. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
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
        let eventInfo = UITextField(frame: (cell?.bounds)!)
        eventInfo.placeholder = "   " + "Title"
        eventInfo.adjustsFontSizeToFitWidth = true
        eventInfo.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        cell?.addSubview(eventInfo)
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func done(_ sender: UIBarButtonItem) {
        
        self.dismiss(animated: true, completion: nil)
    }
}
