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
    
    
    @IBOutlet weak var nombreDetalle: UITextField!
    
    
  /*

    @IBOutlet weak var nombreEditable: UITextField!
    @IBOutlet weak var apellidosEditable: UITextField!
    @IBOutlet weak var edadEditable: UITextField!
    @IBOutlet weak var telefonoEditable: UITextField!
    @IBOutlet weak var direccionEditable: UITextField!
    @IBOutlet weak var cpEditable: UITextField!
    @IBOutlet weak var ciudadEditable: UITextField! */
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func modificarDatos(sender: AnyObject) {
    }

    @IBAction func cancelarDatos(sender: AnyObject) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
