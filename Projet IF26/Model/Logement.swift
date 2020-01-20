//
//  Logement.swift
//  Projet IF26
//
//  Created by Maximilien Regnier on 04/01/2020.
//  Copyright © 2020 Maximilien Regnier. All rights reserved.
//

import CoreData

class Logement: NSManagedObject{
        static var all: [Logement] {
        let request: NSFetchRequest<Logement> = Logement.fetchRequest()
        guard let logements = try? AppDelegate.viewContext.fetch(request) else { return [] }
        return logements
    }
    
    static func getLogementFromUser(user :User) -> [Logement]{
        let request: NSFetchRequest<Logement> = Logement.fetchRequest()
        request.predicate = NSPredicate(format: "user == %@", user)
        guard let logements = try? AppDelegate.viewContext.fetch(request) else { return [] }
        return logements
    }
}
