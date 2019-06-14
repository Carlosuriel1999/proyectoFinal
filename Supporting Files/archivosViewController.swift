//
//  archivosViewController.swift
//  FunWithFlags
//
//  Created by macbook on 6/4/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import UIKit
import Firebase

class archivosViewController: UIViewController {
    
    var dato: String = ""

    var descrip: String = ""
   
    @IBOutlet weak var con: UISegmentedControl!
    
    @IBOutlet weak var etiqueta: UILabel!
 
 
    @IBOutlet weak var desc: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        etiqueta.text = dato
     
        desc.text = descrip


   }
    
    @IBAction func da(_ sender: Any) {
        
        let getndex = con.selectedSegmentIndex
        
        switch (getndex) {
        case 0:
            print("Materia")
        case 1:
            performSegue(withIdentifier: "documentos", sender: nil)
        case 2:
            performSegue(withIdentifier: "videos", sender: nil)
        default:
            print("no selecciono")
        }
    }
    
    
}


