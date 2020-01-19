//
//  DetailListViewController.swift
//  Projet IF26
//
//  Created by Maximilien Regnier on 18/01/2020.
//  Copyright © 2020 Maximilien Regnier. All rights reserved.
//

import UIKit

class DetailListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    var piece : Piece!

    var details = Detail.all
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueToDetailAdd" {
            let detailAddVC = segue.destination as! AddDetailController
            detailAddVC.piece = self.piece
        }
    }
    
    @IBAction func showAddDetail(_ sender: Any) {
        performSegue(withIdentifier: "segueToDetailAdd", sender: nil)
    }
    
}

extension DetailListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return details.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath)

        let detail = details[indexPath.row]
        cell.textLabel?.text = detail.name
        cell.detailTextLabel?.text = "\(String(describing: detail.in_state))"

        return cell
    }
}
