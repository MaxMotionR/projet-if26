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
    
    static func getUser(username : String, password : String) -> User?{
        let request: NSFetchRequest<User> = User.fetchRequest()
        let usernamePredicate = NSPredicate(format: "fullname == %@", username)
        let passwordPredicate = NSPredicate(format: "password == %@", password)
        
        let predicateCompound = NSCompoundPredicate(type: .and, subpredicates: [usernamePredicate,passwordPredicate])
        
        request.predicate = predicateCompound
        
        guard let users = try? AppDelegate.viewContext.fetch(request) else { return nil }
        if (users.count>0){
            let user : User = users[0]
            return user
        }
        else{
            return nil
        }
    }
}
