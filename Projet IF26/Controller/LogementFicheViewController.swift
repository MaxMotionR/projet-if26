//
//  LogementFicheViewController.swift
//  Projet IF26
//
//  Created by Maximilien Regnier on 19/01/2020.
//  Copyright © 2020 Maximilien Regnier. All rights reserved.
//

import UIKit

class LogementFicheViewController: UIViewController {

    var logement : Logement!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var locationStateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLabel.text = logement.locataire
        adressLabel.text = "\(logement.adress ?? "adresse") \n \(logement.zip_code ?? "CP") \(logement.city ?? "Ville")"
        locationStateLabel.text = getLocationState()
    }
    
    func getLocationState() -> String{
        if (logement.is_done_out){
            return "Location terminée"
        }
        if (logement.is_done_in){
            return "Location en cours"
        }
            return "Location non commencée"
    }
    
    @IBAction func create(_ sender: Any) {
        performSegue(withIdentifier: "segueToPieceList", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToPieceList" {
            let navVC = segue.destination as! UINavigationController
            let pieceListVC = navVC.viewControllers.first as! PieceListViewController
            pieceListVC.logement = self.logement
        }
    }
}
