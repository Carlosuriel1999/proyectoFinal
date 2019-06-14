//
//  AlumnoTableViewController.swift
//  User-Firebase
//
//  Created by Germán Santos Jaimes on 4/23/19.
//  Copyright © 2019 iosLab. All rights reserved.
//

import UIKit
import Firebase

class AlumnoTableViewController: UITableViewController, UISearchBarDelegate{
    
    var alumnos: [Materia] = []
    var backUpAlumnos: [Materia] = []
    
    var ref: DocumentReference!
    var getRef: Firestore!
    
    @IBOutlet var tabla: UITableView!
    
    @IBOutlet weak var buscador: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRef = Firestore.firestore()
        buscador.delegate = self as! UISearchBarDelegate
        
    
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getAlumnos()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alumnos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        
        let alumno = alumnos[indexPath.row]
        
        cell.textLabel!.text = alumno.nombre
      //  cell.detailTextLabel?.text = alumno.desc
        
        return cell
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "editView"{
//            if let indexPath = tableView.indexPathForSelectedRow{
//                let editView = segue.destination as! EditViewController
//                editView.alumno = alumnos[indexPath.row]
//            }
//        }
//    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Borrar") { (action, indexPath) in
            let alumno: Materia!
            alumno = self.alumnos[indexPath.row]
            self.getRef.collection("Materias").document(alumno.id!).delete()
        }
        
        return [delete]
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else{
            alumnos = backUpAlumnos
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        return
        }
        
        alumnos = backUpAlumnos.filter({ (alumno) -> Bool in
            (alumno.nombre?.lowercased().contains(searchText.lowercased()))!
        })
        
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
    }
    
    
    func getAlumnos(){
        //getRef.collection("alumno").getDocuments { (querySnapshot, error) in
        
        getRef.collection("Materias").addSnapshotListener { (querySnapshot, error) in
            if let error = error{
                print(error.localizedDescription)
            }else{
                self.alumnos.removeAll()
                for document in querySnapshot!.documents{
                    let id = document.documentID
                    let values = document.data()
                    let nombre = values["nombre"] as? String ?? "sin materia"
                    let desc = values["desc"] as? String ?? "sin descripcion"
                    let alumno = Materia(id: id, nombre: nombre, desc: desc)
                    self.alumnos.append(alumno)
                }
                self.backUpAlumnos = self.alumnos
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        let optionMenu = UIAlertController(title: "Escoger Materia", message: "Desea seleccionar esta materia", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        let okAction = UIAlertAction(title: "Seleccionar", style: .default) { (UIAlertAction) in
            if cell?.accessoryType.rawValue == 0 {
                cell?.accessoryType = .checkmark
                
            }else{
                cell?.accessoryType = .none
            }
            self.performSegue(withIdentifier: "archivos", sender: self)
        }
        
        optionMenu.addAction(cancelAction)
        optionMenu.addAction(okAction)
        present(optionMenu, animated: true, completion: nil)
        
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return false
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indexPath = tabla.indexPathForSelectedRow
        
        let secondView = segue.destination as? archivosViewController
        let alumno = alumnos[(indexPath?.row)!]
        
        secondView?.dato = alumno.nombre!
        secondView?.descrip = alumno.desc!
        
    }
    
   
    


    
    
    
}
