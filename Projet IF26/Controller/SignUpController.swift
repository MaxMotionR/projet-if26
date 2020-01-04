//
//  SignUpController.swift
//  Projet IF26
//
//  Created by Maximilien Regnier on 04/01/2020.
//  Copyright © 2020 Maximilien Regnier. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBAction func singupAction(_ sender: UIButton) {
        if((loginField.text?.isEmpty ?? false) || (passwordField.text?.isEmpty ?? false) ){
            let alert = UIAlertController(title: "Erreur", message: "Veuillez compléter tous les champs", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

            self.present(alert, animated: true)
        }else{

            signup(login: loginField.text!, password: passwordField.text!)
        }
    }
    
    private func signup(login: String, password: String){
        let user = User(context: AppDelegate.viewContext)
        user.fullname = login
        user.password = password
        
        try? AppDelegate.viewContext.save()
        
        self.dismiss(animated: true)
    }
}
