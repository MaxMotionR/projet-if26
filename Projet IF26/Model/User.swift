//
//  User.swift
//  Projet IF26
//
//  Created by Maximilien Regnier on 04/01/2020.
//  Copyright © 2020 Maximilien Regnier. All rights reserved.
//

import CoreData

class User: NSManagedObject{
        static var all: [User] {
        let request: NSFetchRequest<User> = User.fetchRequest()
        guard let users = try? AppDelegate.viewContext.fetch(request) else { return [] }
        return users
    }
}
