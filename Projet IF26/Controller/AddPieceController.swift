//
//  AddPieceController.swift
//  Projet IF26
//
//  Created by Maximilien Regnier on 04/01/2020.
//  Copyright © 2020 Maximilien Regnier. All rights reserved.
//

import UIKit

class AddPieceController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var logement : Logement!
    @IBOutlet weak var pieceField: UITextField!
    
    @IBAction func saveAction(_ sender: UIButton) {
        if(pieceField.text?.isEmpty ?? false){
            let alert = UIAlertController(title: "Erreur", message: "Veuillez compléter tous les champs", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

            self.present(alert, animated: true)
        }else{
            save(name: pieceField.text!)
        }
    }
    
    private func save(name: String){
        let piece = Piece(context: AppDelegate.viewContext)

        // Info from text input
        piece.name = name
        piece.logement = self.logement
        
        try? AppDelegate.viewContext.save()
        
        self.dismiss(animated: true, completion: nil)

    }
}
