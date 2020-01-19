//
//  Detail.swift
//  Projet IF26
//
//  Created by Maximilien Regnier on 18/01/2020.
//  Copyright © 2020 Maximilien Regnier. All rights reserved.
//

import CoreData


class Detail: NSManagedObject{
        static var all: [Detail] {
        let request: NSFetchRequest<Detail> = Detail.fetchRequest()
        guard let details = try? AppDelegate.viewContext.fetch(request) else { return [] }
        return details
    }
}
