//
//  AddLogementController.swift
//  Projet IF26
//
//  Created by Maximilien Regnier on 04/01/2020.
//  Copyright © 2020 Maximilien Regnier. All rights reserved.
//

import UIKit

class AddLogementController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var fullnameField: UITextField!
    @IBOutlet weak var adressField: UITextField!
    @IBOutlet weak var zipCodeField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    
    
    
    
    @IBAction func saveAction(_ sender: UIButton) {
        if((fullnameField.text?.isEmpty ?? false) || (adressField.text?.isEmpty ?? false) || (zipCodeField.text?.isEmpty ?? false) || (cityField.text?.isEmpty ?? false) ){
            let alert = UIAlertController(title: "Erreur", message: "Veuillez compléter tous les champs", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

            self.present(alert, animated: true)
        }else{
            save(fullname: fullnameField.text!, adress: adressField.text!, zipCode: zipCodeField.text!, city: cityField.text!)
        }
    }
    
    private func save(fullname: String, adress: String, zipCode: String, city: String){
        let logement = Logement(context: AppDelegate.viewContext)
    
        //Basic info to save
        logement.is_done_in = false
        logement.is_done_out = false
        logement.created_at = Date()
        
        // Info from text input
        logement.locataire = fullname
        logement.adress = adress
        logement.zip_code = zipCode
        logement.city = city
        
        //TODO : Save the user
        
        
        try? AppDelegate.viewContext.save()
        
        //TODO go to make etat des lieux
    }
}
