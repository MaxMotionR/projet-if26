//
//  LogementListViewController.swift
//  Projet IF26
//
//  Created by Maximilien Regnier on 18/01/2020.
//  Copyright © 2020 Maximilien Regnier. All rights reserved.
//

import UIKit

class LogementListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //print (self.user)
    }
    
    var user: User!
    var logement : Logement!
    var logements = Logement.all
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        logements = Logement.getLogementFromUser(user: user)
        print("reload")
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToLogementFiche" {
            let logementFicheVC = segue.destination as! LogementFicheViewController
            logementFicheVC.logement = self.logement
        }
        
        if segue.identifier == "segueToLogementAdd" {
            let logementAddVC = segue.destination as! AddLogementController
            logementAddVC.user = self.user
        }
    }
    
    @IBAction func showAddLogement(_ sender: Any) {
        performSegue(withIdentifier: "segueToLogementAdd", sender: nil)
    }
    
}

extension LogementListViewController: UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logements.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LogementCell", for: indexPath)

        let logement = logements[indexPath.row]
        cell.textLabel?.text = logement.locataire
        cell.detailTextLabel?.text = "\(String(describing: logement.adress))"

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            self.logement = logements[indexPath.row]
            performSegue(withIdentifier: "segueToLogementFiche", sender: nil)
    }
}
