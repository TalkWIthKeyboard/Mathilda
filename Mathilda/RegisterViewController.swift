//
//  RegisterViewController.swift
//  Mathilda
//
//  Created by Yang Li on 18/11/2016.
//  Copyright © 2016 Mathilda. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RegisterViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    @IBOutlet weak var register: UIButton!
    
    @IBOutlet weak var account: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordAgain: UITextField!
    
    @IBOutlet weak var male: UIButton!
    @IBOutlet weak var female: UIButton!
    
    var sex: String = "male"

    @IBAction func male(_ sender: UIButton) {
        sender.setTitleColor(UIColor(colorLiteralRed: 49/255, green: 122/255, blue: 247/255, alpha: 1), for: .normal)
        female.setTitleColor(UIColor.black, for: .normal)
    }
    
    @IBAction func female(_ sender: UIButton) {
        sender.setTitleColor(UIColor(colorLiteralRed: 49/255, green: 122/255, blue: 247/255, alpha: 1), for: .normal)
        male.setTitleColor(UIColor.black, for: .normal)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = false
        
        register.layer.cornerRadius = 5
        register.layer.borderWidth = 1
        register.layer.borderColor = UIColor(colorLiteralRed: 21/255, green: 126/255, blue: 251/255, alpha: 0.9).cgColor
        male.setTitleColor(UIColor(colorLiteralRed: 49/255, green: 122/255, blue: 247/255, alpha: 1), for: .normal)
    }
    
    @IBAction func register(_ sender: UIButton) {
        let alertView = UIAlertController(title: "注册失败", message: "", preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "好", style: .default, handler: { (action) in
            self.dismiss(animated: true, completion: nil)
        }))
        
        guard account.text != "" else {
            alertView.message = "请输入账号"
            self.present(alertView, animated: true, completion: nil)
            return
        }
        guard username.text != "" else {
            alertView.message = "请输入用户名"
            self.present(alertView, animated: true, completion: nil)
            return
        }
        guard password.text != "" else {
            alertView.message = "请输入密码"
            self.present(alertView, animated: true, completion: nil)
            return
        }
        guard passwordAgain.text != "" else {
            alertView.message = "请确认密码"
            self.present(alertView, animated: true, completion: nil)
            return
        }
        
        guard password.text == passwordAgain.text else {
            alertView.message = "密码输入不一致"
            self.present(alertView, animated: true, completion: nil)
            return
        }
        
        if female.currentTitleColor == UIColor(colorLiteralRed: 49/255, green: 122/255, blue: 247/255, alpha: 1){
            sex = "female"
        } else {
            sex = "male"
        }
        
        let userRegParameters: Parameters = [
            "account": account.text!,
            "username": username.text!,
            "password": password.text!,
            "sex": sex
        ]
        
        Alamofire.request("http://115.159.1.222:3000/mng/user/register", method: .post, parameters: userRegParameters).responseString { (response) in
            let responseData = response.result.value!
            let responseJson = JSON(data: responseData.data(using: String.Encoding.utf8)!)
            guard responseJson["info"]["number"].stringValue != ERROR_INFO["ACCOUNT_ERR"]?["number"] else {
                let alertView = UIAlertController(title: "注册失败", message: "", preferredStyle: .alert)
                alertView.addAction(UIAlertAction(title: "好", style: .default, handler: { (action) in
                    self.dismiss(animated: true, completion: nil)
                }))
                alertView.message = "账号已存在"
                self.present(alertView, animated: true, completion: nil)
                return
            }
            if responseJson["info"]["number"].stringValue == ERROR_INFO["SUCCESS"]?["number"] {
                let alertView = UIAlertController(title: "注册成功", message: "恭喜", preferredStyle: .alert)
                alertView.addAction(UIAlertAction(title: "开启音乐之旅", style: .default, handler: { (action) in
                    self.dismiss(animated: true, completion: nil)
                }))
                self.present(alertView, animated: true, completion: nil)
            }
        }
        if let loginViewController = (self.navigationController?.viewControllers[0]) as? LoginViewController {
            loginViewController.account.text = self.account.text
            loginViewController.password.text = self.password.text
        }
        
        _ = self.navigationController?.popViewController(animated: true)

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
    
    @IBAction func popNavigation(_ sender: UIBarButtonItem) {
        _ = self.navigationController?.popViewController(animated: true)
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
