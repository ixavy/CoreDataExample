//
//  RegistrosTableViewController.swift
//  AgendaSwiftTutorial
//
//  Created by Javier  on 4/11/15.
//  Copyright © 2015 ixavy. All rights reserved.
//

import UIKit
import CoreData

class RegistrosTableViewController: UITableViewController {
    
    var datosDeConsulta: Array<AnyObject> = []
    
    // Presentar Datos en la Vista de Tabla
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    // Declarar una constante de la Clase AppDelegate
        
        let appdel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
    // Declarar una constante de mi ManagedObjectContext
        
        let managedObjectContext: NSManagedObjectContext = appdel.managedObjectContext
        
    // Declarar una constante de la Clase NSFetchRequest, de Consulta de Datos
        
        let frequest = NSFetchRequest(entityName: "Persona")
        
    // Cargar en mi Array y hacer la Consulta
        
        datosDeConsulta = try! managedObjectContext.executeFetchRequest(frequest)
        
    // Recargar mi Tabla para que muestre los Datos Actualizados
        
        tableView.reloadData()
    }
    

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datosDeConsulta.count
    }
 
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let datos = datosDeConsulta[indexPath.row] as! NSManagedObject
        
        let nombre = datos.valueForKeyPath("nombre") as! String
        let apellidos = datos.valueForKeyPath("apellidos") as! String
        
        cell.textLabel?.text = "\(nombre) , \(apellidos)"
        
        cell.detailTextLabel?.text = datos.valueForKeyPath("direccion") as? String

        return cell
    }
  
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
 
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let contexto: NSManagedObjectContext = appDel.managedObjectContext as NSManagedObjectContext
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            // Borrar Entidad del CoreData
            
            contexto.deleteObject(datosDeConsulta[indexPath.row] as! NSManagedObject)
            
            // Borrar la fila del Array que contiene todas las filas
            datosDeConsulta.removeAtIndex(indexPath.row)
            
            // Borrar la fila de la Tabla
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            
            try! contexto.save()
        }
    }

    // MARK: - Navigation

    // Implementar un método que haga que al cambiar a la vista detalle, se presenten los datos en los TextField

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Poner un condicional para ver si el identificador es el mismo

        if segue.identifier == "actualizar"{

            // Creo una variable que almacena el índice de mi Tabla
            let indexPath: NSIndexPath = self.tableView.indexPathForSelectedRow!

            // Creo un objeto de la clase NSManagedObject y le paso mi array y la fila seleccionada
            let persona: Persona = datosDeConsulta[indexPath.row] as! Persona

            // Creo una instancia del ViewController al que voy, para pasarle los parámetros
            let vistaDetalle: ViewControllerDetalle? = segue.destinationViewController as? ViewControllerDetalle

            // Pasar a la propiedad de tipo String de mi vistaDetalle, el valor seleccionado en la propiedad persona
            
            vistaDetalle?.nombre = persona.nombre
            vistaDetalle?.apellidos = persona.apellidos
            vistaDetalle?.edad = persona.edad
            vistaDetalle?.telefono = persona.telefono
            vistaDetalle?.direccion = persona.direccion
            vistaDetalle?.cp = persona.codigoPostal
            vistaDetalle?.ciudad = persona.ciudad
        }
    }
}
