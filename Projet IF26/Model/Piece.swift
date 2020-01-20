//
//  Piece.swift
//  Projet IF26
//
//  Created by Maximilien Regnier on 04/01/2020.
//  Copyright © 2020 Maximilien Regnier. All rights reserved.
//

import CoreData

class Piece: NSManagedObject{
        static var all: [Piece] {
        let request: NSFetchRequest<Piece> = Piece.fetchRequest()
        guard let pieces = try? AppDelegate.viewContext.fetch(request) else { return [] }
        return pieces
    }
    
    static func getPiecesFromLogement(logement : Logement) -> [Piece]{
        let request: NSFetchRequest<Piece> = Piece.fetchRequest()
        request.predicate = NSPredicate(format:"logement == %@", logement)
        guard let pieces = try? AppDelegate.viewContext.fetch(request) else { return [] }
        return pieces
    }
}
