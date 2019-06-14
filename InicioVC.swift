//
//  InicioVC.swift
//  Vistas
//
//  Created by Macbook on 11/28/18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import UIKit

import Lottie

class InicioVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(showMaterias), name: NSNotification.Name("ShowMaterias"), object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(showVideos), name: NSNotification.Name("ShowVideos"), object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(showLibros), name: NSNotification.Name("ShowLibros"), object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(showPruebas), name: NSNotification.Name("ShowPruebas"), object: nil)
        

        
      
    }
    
    @objc func showMaterias(){
        performSegue(withIdentifier: "ShowMaterias", sender: nil)
    }
    @objc func showVideos(){
        performSegue(withIdentifier: "ShowVideos", sender: nil)
    }
    @objc func showLibros(){
        performSegue(withIdentifier: "ShowLibros", sender: nil)
    }
    @objc func showPruebas(){
        performSegue(withIdentifier: "ShowPruebas", sender: nil)
    }
    
    @IBAction func Opciones(){
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
    }

   

}
