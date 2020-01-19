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
        adressLabel.text = logement.adress
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
    

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
