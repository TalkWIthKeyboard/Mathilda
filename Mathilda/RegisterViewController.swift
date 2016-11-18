//
//  RegisterViewController.swift
//  Mathilda
//
//  Created by Yang Li on 18/11/2016.
//  Copyright © 2016 Mathilda. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var register: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = false
        
        register.layer.cornerRadius = 5
        register.layer.borderWidth = 1
        register.layer.borderColor = UIColor(colorLiteralRed: 21/255, green: 126/255, blue: 251/255, alpha: 0.9).cgColor
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        resignFirstResponder()
        for subView in self.view.subviews {
            if subView.isKind(of: UITextField.self) {
                subView.resignFirstResponder()
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
