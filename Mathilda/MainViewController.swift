//
//  MainViewController.swift
//  Mathilda
//
//  Created by Yang on 13/11/2016.
//  Copyright © 2016 Mathilda. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    let userDefault = UserDefaults.standard
    guard userDefault.bool(forKey: "isLogin") else {
      self.performSegue(withIdentifier: "login", sender: nil)
      return
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
  }
}
