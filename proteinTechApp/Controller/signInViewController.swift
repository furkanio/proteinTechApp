//
//  ViewController.swift
//  proteinTechApp
//
//  Created by Furkan Yıldız on 23.08.2021.
//

import UIKit

class signInViewController: UIViewController {
    
    @IBOutlet weak var userNameTextLabel: UITextField!
    @IBOutlet weak var passwordTextLabel: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        passwordTextLabel.isSecureTextEntry = true
    }
    
    enum usernameAccessPoints {
        case username(String)
        
    }
    
    var usernameAccessType = usernameAccessPoints.username("9nd54")
    
    var authdata : [String] = ["9nd54", "v542w", "17pcy0", "gbf48", "zdah4"]
        
    
    @IBAction func signInButton(_ sender: Any) {
        
        if userNameTextLabel.text != "" && passwordTextLabel.text != "" {
            
            if userNameTextLabel.text == nil && passwordTextLabel.text == nil {
                self.makeAlert(titleInput: "Error", messageInput: "Doğruluğundan emin olunuz!")
            }else if userNameTextLabel.text == "9nd54" && passwordTextLabel.text == "9nd54"  {
                self.performSegue(withIdentifier: "listFriendSegue", sender: nil)
            } else {
                self.makeAlert(titleInput: "sigIn Error", messageInput: "Lütfen tekrar dene")
            }
        } else {
            makeAlert(titleInput: "Error!", messageInput: "Username/Password")
        }
    
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        
        if userNameTextLabel.text != "" && passwordTextLabel.text != "" {
            
        }
    }
    
    
    
    func makeAlert(titleInput:String, messageInput:String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    
        
    }
    

}

