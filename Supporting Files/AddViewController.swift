//
//  AddViewController.swift
//  User-Firebase
//
//  Created by Germán Santos Jaimes on 4/8/19.
//  Copyright © 2019 iosLab. All rights reserved.
//

import UIKit
import Firebase
import MobileCoreServices
import FirebaseUI



class AddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var nombreTF: UITextField!
    @IBOutlet weak var apellidoTF: UITextField!
    @IBOutlet weak var photo: UIImageView!
    
    var ref: DocumentReference!
    var getRef: Firestore!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRef = Firestore.firestore()
        
        
        
    }
    
    @IBAction func addAlumno(_ sender: UIButton){
        var datos: [String: Any] = ["nombre": nombreTF.text, "apellido":apellidoTF.text]
        
        
        
        
        ref = getRef.collection("alumno").addDocument(data: datos, completion: { (error) in
            if let error = error {
                print(error.localizedDescription)
            }else{
                print("Se guardaron exitosamente los datos")
                
                //self.navigationController?.popViewController(animated: true)
            }
        })
        
    
    }
    
    
    @IBAction func selectImage(_ sender: UIButton) {
        let photoImage = UIImagePickerController()
        photoImage.sourceType = UIImagePickerController.SourceType.photoLibrary
        photoImage.mediaTypes = [kUTTypeImage as String]
        photoImage.delegate = self
        present(photoImage, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let imageSelected = info[UIImagePickerController.InfoKey.originalImage] as? UIImage, let optimizedImageData = imageSelected.jpegData(compressionQuality: 0.6){
            photo.image = imageSelected
            uploadImage(imageData: optimizedImageData)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    
    func uploadImage(imageData: Data){
        let activityIndicator = UIActivityIndicatorView.init(style: .gray)
        activityIndicator.startAnimating()
        activityIndicator.center = self.view.center
        view.addSubview(activityIndicator)
        
        let storageReference = Storage.storage().reference()
        let userImageRef = storageReference.child("/photos").child(ref.documentID)
        let uploadMetadata = StorageMetadata()
        uploadMetadata.contentType = "image/jpeg"
        
        userImageRef.putData(imageData, metadata: uploadMetadata) { (storageMetadata, error) in
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
            
            if let error = error{
                print(error.localizedDescription)
            }else{
                print("metadata: ", storageMetadata?.path)
                self.navigationController?.popViewController(animated: true)
            }
        }
        
        
        
        
    }
    
    
}
