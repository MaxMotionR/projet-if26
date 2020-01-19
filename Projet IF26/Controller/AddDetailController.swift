//
//  AddDetailController.swift
//  Projet IF26
//
//  Created by Maximilien Regnier on 05/01/2020.
//  Copyright © 2020 Maximilien Regnier. All rights reserved.
//

import UIKit

class AddDetailController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let state = ["Neuf","Bon","Moyen","Mauvais","Très mauvais"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var objetField: UITextField!
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var commentField: UITextField!
    
    @IBAction func saveAction(_ sender: UIButton) {
        if((objetField.text?.isEmpty ?? false) || (commentField.text?.isEmpty ?? false)){
            let alert = UIAlertController(title: "Erreur", message: "Veuillez compléter tous les champs", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

            self.present(alert, animated: true)
        }else{
            save(name: objetField.text!, comment: commentField.text!)
        }
    }
    
    private func save(name: String, comment: String){
        let detail = Detail(context: AppDelegate.viewContext)

        // Info from text input
        detail.name = name
        detail.in_state = self.state[statePicker.selectedRow(inComponent: 0)]
        detail.comment = comment
        
        //TODO : Save the piece
        
         
        try? AppDelegate.viewContext.save()
        
        //TODO go back
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.state.count

    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.state[row]
    }
    
}
