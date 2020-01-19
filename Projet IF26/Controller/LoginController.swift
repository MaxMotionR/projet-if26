//
//  LoginController.swift
//  Projet IF26
//
//  Created by Maximilien Regnier on 29/12/2019.
//  Copyright © 2019 Maximilien Regnier. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func loginAction(_ sender: Any) {
        if((usernameField.text?.isEmpty ?? false) || (passwordField.text?.isEmpty ?? false)){
            if(self.checkCredential(username: usernameField.text!, password: passwordField.text!)){
                performSegue(withIdentifier: "segueToLogementList", sender: nil)
            }else{
                let alert = UIAlertController(title: "Erreur", message: "Identifiant incorrect", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

                self.present(alert, animated: true)
            }
        }
    }
    
    
    func checkCredential(username : String, password: String) -> Bool{
        let user = User.getUser(username: username, password: password)
        
        if(user != nil){
            self.user = user
            return true
        }
        
        return false
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToLogementList" {
            let logementListVC = segue.destination as! LogementListViewController
            logementListVC.user = self.user
        }
    }
}
