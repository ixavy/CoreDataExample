//
//  ViewControllerDetalle.swift
//  AgendaSwiftTutorial
//
//  Created by Javier  on 4/11/15.
//  Copyright © 2015 ixavy. All rights reserved.
//

import UIKit
import CoreData

class ViewControllerDetalle: UIViewController {
    
// MARK: - Propiedades
    
    @IBOutlet weak var nombreEditable: UITextField!
    @IBOutlet weak var apellidosEditable: UITextField!
    @IBOutlet weak var edadEditable: UITextField!
    @IBOutlet weak var telefonoEditable: UITextField!
    @IBOutlet weak var direccionEditable: UITextField!
    @IBOutlet weak var cpEditable: UITextField!
    @IBOutlet weak var ciudadEditable: UITextField!
    
    // Variables de tipo String para cada uno de mis TextField
    
    var nombre: String? = ""
    var apellidos: String? = ""
    var edad: String? = ""
    var telefono: String? = ""
    var direccion: String? = ""
    var cp: String? = ""
    var ciudad: String? = ""
    
    // Variable que sirve para comprobar la existencia de Persona
    
    var existePersona: NSManagedObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.nombreEditable.text = self.nombre
        self.apellidosEditable.text = self.apellidos
        self.edadEditable.text = self.edad
        self.telefonoEditable.text = self.telefono
        self.direccionEditable.text = self.direccion
        self.cpEditable.text = self.cp
        self.ciudadEditable.text = self.ciudad
    }
    
// MARK: - Métodos Propios
    
    @IBAction func modificarDatos(sender: AnyObject) {
        
        let myDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedObjectContext: NSManagedObjectContext = myDelegate.managedObjectContext
        
 //       let entityDescription = NSEntityDescription.entityForName("Persona", inManagedObjectContext: managedObjectContext)
        
       if (existePersona != nil) {
            existePersona.setValue(nombreEditable.text! as String, forKey: "nombre")
            existePersona.setValue(apellidosEditable.text! as String, forKey: "apellidos")
            existePersona.setValue(edadEditable.text! as String, forKey: "edad")
            existePersona.setValue(telefonoEditable.text! as String, forKey: "telefono")
            existePersona.setValue(direccionEditable.text! as String, forKey: "direccion")
            existePersona.setValue(cpEditable.text! as String, forKey: "codigoPostal")
            existePersona.setValue(ciudadEditable.text! as String, forKey: "ciudad")
        } else {

            let newPersona: Persona = NSEntityDescription.insertNewObjectForEntityForName("Persona", inManagedObjectContext: managedObjectContext) as! Persona
            
            newPersona.nombre = self.nombreEditable.text
            newPersona.apellidos = self.apellidosEditable.text
            newPersona.edad = self.edadEditable.text
            newPersona.telefono = self.telefonoEditable.text
            newPersona.direccion = self.direccionEditable.text
            newPersona.codigoPostal = self.cpEditable.text
            newPersona.ciudad = self.ciudadEditable.text
        }

        try! managedObjectContext.save()
        
        navigationController?.popToRootViewControllerAnimated(true)
    }

    @IBAction func cancelarDatos(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }

// MARK: - Métodos Delegados

}
