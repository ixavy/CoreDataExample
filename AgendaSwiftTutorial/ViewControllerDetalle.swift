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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// MARK: - Métodos Propios
    
    @IBAction func modificarDatos(sender: AnyObject) {
    }

    @IBAction func cancelarDatos(sender: AnyObject) {
    }

// MARK: - Métodos Delegados

}
