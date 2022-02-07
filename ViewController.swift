//
//  ViewController.swift
//  Demo09 ShoppingListWithSeverLogin
//
//  Created by LukeLin on 2022/1/22.
//

import UIKit
import FBSDKLoginKit
class ViewController: UIViewController {
    
    @IBOutlet var FBLoginButton: UIButton! {
        didSet {
            FBLoginButton.layer.cornerRadius = 10
            FBLoginButton.layer.masksToBounds = true
        }
    }
    @IBOutlet var accountTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var LoginButton: UIButton! {
        didSet {
            LoginButton.layer.cornerRadius = 10
            LoginButton.layer.masksToBounds = true
        }
    }
    @IBOutlet var TitleLabel: UILabel! {
        didSet {
            TitleLabel.layer.cornerRadius = 10
            TitleLabel.layer.masksToBounds = true
        }
    }

    
    @IBAction func LoginBtnTapped(_ sender: Any) {
        if accountTextField.text == "1234" && passwordTextField.text == "1234" {
            self.performSegue(withIdentifier: "SegueToProductList", sender: sender)
        }else{
            let alertcontroller = UIAlertController(title: "WRONG!", message: "please check your password", preferredStyle: .alert)
            alertcontroller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertcontroller, animated: true, completion: nil)
        }
    }
    

    @IBAction func fbLoginBtnTapped(_ sender: Any) {
            //只使用FB登入
            let manager = LoginManager()
                manager.logIn { (result) in
                   if case LoginResult.success(granted: _, declined: _, token: _) = result {
                          print("login ok")
                    self.performSegue(withIdentifier: "SegueToProductList", sender: sender)
                      } else {
                          print("login fail")
                      }
                }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        // Do any additional setup after loading the view.
        
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}




