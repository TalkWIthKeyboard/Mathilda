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

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var account: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func login(_ sender: UIButton) {
        
        let userParameters: Parameters = [
            "account": account.text!,
            "password": password.text!
        ]
        
        Alamofire.request("http://115.159.1.222:3000/mng/user/login", method: .post, parameters: userParameters).responseString { (response) in
            let responseData = response.result.value!
            let responseJson = JSON(data: responseData.data(using: String.Encoding.utf8, allowLossyConversion: false)!)
            print(responseJson)
            
            switch responseJson["number"].stringValue {
            case "200":
                //  print("操作成功完成")
                let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
                hud.label.text = "登录中..."
            case "401":
                let alert = AlertController(title: "登录失败", message: "未输入用户名或密码", preferredStyle: .alert)
                alert.add(AlertAction(title: "确定", style: .preferred))
                alert.present()
            case "300":
                let alert = AlertController(title: "登录失败", message: "用户名或密码错误，请重新输入", preferredStyle: .alert)
                alert.add(AlertAction(title: "确定", style: .preferred))
                alert.present()
            case "301":
                let alert = AlertController(title: "登录失败", message: "不存在此用户", preferredStyle: .alert)
                alert.add(AlertAction(title: "确定", style: .preferred))
                alert.present()
            default:
                print("其他错误")
                print("错误代码：" + responseJson["number"].stringValue)
            }
            
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    @IBAction func wechatLogin(_ sender: UIButton) {
        print("wechat login")
        // to do
    }

    @IBAction func qqLogin(_ sender: UIButton) {
        print("qq login")
        // to do
    }
    
    @IBAction func weiboLogin(_ sender: UIButton) {
        print("weibo login")
        // to do
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
