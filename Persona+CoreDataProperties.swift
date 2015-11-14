//
//  Persona+CoreDataProperties.swift
//  AgendaSwiftTutorial
//
//  Created by Javier  on 13/11/15.
//  Copyright © 2015 ixavy. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Persona {

    @NSManaged var apellidos: String?
    @NSManaged var ciudad: String?
    @NSManaged var codigoPostal: String?
    @NSManaged var direccion: String?
    @NSManaged var edad: String?
    @NSManaged var nombre: String?
    @NSManaged var telefono: String?

}
