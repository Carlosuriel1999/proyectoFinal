//
//  tableViewController.swift
//  FunWithFlags
//
//  Created by macbook on 6/13/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import UIKit

class tableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
  
    

    @IBOutlet weak var table: UITableView!
    
    @IBOutlet var buscar: UISearchBar!
    
    var pdfArr = [[String]]()
    var backupDoc = [[String]]()
    let sections = ["Mecanica","Probabilidad","Matematicas Aplicadas","Fisica","Quimica y Termodinamica"]
    let items = [ ["Cinematica y Dinamica","Estatica"],
                  ["Dibujo","Estadistica"],
                  ["Matematicas avanzadas","Analisis Numerico","Ecuaciones Diferenciales"],["Acustica","Optica","Electricidad y Magnetismo","Fisica","Fisica Experimental"], ["Quimica","Termodinamica"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        table.delegate = self
        //        table.dataSource = self
        pdfArr = [ ["Cinematica","Estatica"],["Dibujo","Estadistica"],["Matematicas Avanzadas","Analisis numerico","Ecuaciones-Diferenciales"],["Acustica","Optica","Electricidad y Magnetismo","Fisica","Fisica Experimental"],["quimica","Termodinamica"]]
        
        buscar.delegate = self as! UISearchBarDelegate
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.section][indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.red
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("seleccionado \(items[indexPath.section][indexPath.row])")
        pdfname = pdfArr[indexPath.section][indexPath.row]
        performSegue(withIdentifier: "siguiente", sender: AnyObject?.self)
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else{
            pdfArr = backupDoc
//            DispatchQueue.main.async{
//                self.tableView.reloadData()
            //            }
            return
        }
        
//        pdfArr = backupDoc.filter({ (cell) -> Bool in
//            (pdfArr?.lowercased().contains(searchText.lowercased()))!
//        })
        
//        DispatchQueue.main.async{
//            self.tableView.reloadData()
//        }
    }
    

}
