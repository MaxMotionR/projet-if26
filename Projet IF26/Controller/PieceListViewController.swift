//
//  PieceListViewController.swift
//  Projet IF26
//
//  Created by Maximilien Regnier on 18/01/2020.
//  Copyright © 2020 Maximilien Regnier. All rights reserved.
//

import UIKit

class PieceListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self

    }
    
    var logement : Logement!
    var pieces = Piece.all
    var piece : Piece!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pieces = Piece.all
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueToDetailList" {
            let detailListVC = segue.destination as! DetailListViewController
            detailListVC.piece = self.piece
        }
        
        if segue.identifier == "segueToPieceAdd" {
            let pieceAddVC = segue.destination as! AddPieceController
            pieceAddVC.logement = self.logement
        }
    }
    
    @IBAction func showAddPiece(_ sender: Any) {
                performSegue(withIdentifier: "segueToPieceAdd", sender: nil)
    }
    

}

extension PieceListViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pieces.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PieceCell", for: indexPath)

        let piece = pieces[indexPath.row]
        cell.textLabel?.text = piece.name

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.piece = self.pieces[indexPath.row]
        performSegue(withIdentifier: "segueToDetailList", sender: nil)
    }
}
