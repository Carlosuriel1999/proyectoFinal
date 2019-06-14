//
//  leccionesTableViewController.swift
//  revdeP
//
//  Created by macbook on 6/5/19.
//  Copyright © 2019 diegoramireznieves. All rights reserved.
//

import UIKit

class leccionesTableViewController: UITableViewController {
    
    var lecciones = [String]()
    var pdfArr = [String]()
    var sections = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sections = ["Mecanica"]
        lecciones = ["Leccion 1", "Leccion 2", "Leccion 3", "Leccion 4"]
        pdfArr = ["1l","2","3","4"]

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lecciones.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let abc = tableView.dequeueReusableCell(withIdentifier: "abc") as UITableViewCell?
        

        let mylabel = abc!.viewWithTag(100) as! UILabel
        mylabel.text = lecciones[indexPath.row]
        
        return abc!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pdfname = pdfArr[indexPath.row]
        performSegue(withIdentifier: "siguiente", sender: AnyObject?.self)
    }

   

}
