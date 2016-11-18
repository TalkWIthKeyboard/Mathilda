//
//  LoginViewController.swift
//  Mathilda
//
//  Created by Yang on 13/11/2016.
//  Copyright © 2016 Mathilda. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDCAlertView
import MBProgressHUD

class LoginViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet weak var account: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var register: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
        
        register.layer.cornerRadius = 5
        register.layer.borderWidth = 1
        register.layer.borderColor = UIColor(colorLiteralRed: 21/255, green: 126/255, blue: 251/255, alpha: 0.9).cgColor
    }
    
    @IBAction func login(_ sender: UIButton) {
        
        let userParameters: Parameters = [
            "account": account.text!,
            "password": password.text!
        ]
        
        Alamofire.request("http://115.159.1.222:3000/mng/user/login", method: .post, parameters: userParameters).responseString { (response) in
            let responseData = response.result.value!
            let responseJson = JSON(data: responseData.data(using: String.Encoding.utf8, allowLossyConversion: false)!)

            switch responseJson["info"]["number"].stringValue {
            case (ERROR_INFO["SUCCESS"]?["number"])!:
                let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
                hud.label.text = "登录中..."
            case (ERROR_INFO["REQUEST_ERR"]?["number"])!:
                let alert = AlertController(title: "登录失败", message: "请输入用户名或密码", preferredStyle: .alert)
                alert.add(AlertAction(title: "确定", style: .preferred))
                alert.present()
            case (ERROR_INFO["PASSWD_ERR"]?["number"])!:
                let alert = AlertController(title: "登录失败", message: "用户名或密码错误，请重新输入", preferredStyle: .alert)
                alert.add(AlertAction(title: "确定", style: .preferred))
                alert.present()
            case (ERROR_INFO["USER_ERR"]?["number"])!:
                let alert = AlertController(title: "登录失败", message: "不存在此用户", preferredStyle: .alert)
                alert.add(AlertAction(title: "确定", style: .preferred))
                alert.present()
            default:
                print("其他错误：" + responseJson["value"].stringValue)
                print("错误代码：" + responseJson["number"].stringValue)
            }
            
        }
        
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
    
    @IBAction func wechatLogin(_ sender: UIButton) {
        print("wechat login")
//        to do
    }

    @IBAction func qqLogin(_ sender: UIButton) {
        print("qq login")
//        to do
    }
    
    @IBAction func weiboLogin(_ sender: UIButton) {
        print("weibo login")
//        to do
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
