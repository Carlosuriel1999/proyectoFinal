//
//  MateriasViewController.swift
//  FunWithFlags
//
//  Created by macbook on 6/3/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import UIKit
import Firebase


class MateriasViewController: UITableViewController, UISearchBarDelegate {

    var alumnos: [Alumno] = []
    var backUpAlumnos: [Alumno] = []
    
    var ref: DocumentReference!
    var getRef: Firestore!
    
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
        cell.detailTextLabel?.text = alumno.apellido
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editView"{
            if let indexPath = tableView.indexPathForSelectedRow{
                let editView = segue.destination as! EditViewController
                editView.alumno = alumnos[indexPath.row]
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Borrar") { (action, indexPath) in
            let alumno: Alumno!
            alumno = self.alumnos[indexPath.row]
            self.getRef.collection("alumno").document(alumno.id!).delete()
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
        
        getRef.collection("alumno").addSnapshotListener { (querySnapshot, error) in
            if let error = error{
                print(error.localizedDescription)
            }else{
                self.alumnos.removeAll()
                for document in querySnapshot!.documents{
                    let id = document.documentID
                    let values = document.data()
                    let nombre = values["nombre"] as? String ?? "sin nombre"
                    let apellido = values["apellido"] as? String ?? "sin apellido"
                    let alumno = Alumno(id: id, nombre: nombre, apellido: apellido)
                    self.alumnos.append(alumno)
                }
                self.backUpAlumnos = self.alumnos
                self.tableView.reloadData()
            }
        }
    }

}
