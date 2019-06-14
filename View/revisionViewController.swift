//
//  revisionViewController.swift
//  revdeP
//
//  Created by macbook on 6/5/19.
//  Copyright © 2019 diegoramireznieves. All rights reserved.
//

import UIKit
import WebKit

var pdfname = ""

class revisionViewController: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
        let path = Bundle.main.path(forResource: pdfname, ofType: "pdf")
        let url = URL(fileURLWithPath: path!)
        let urlrquest = URLRequest(url: url)
        
        webview.load(urlrquest)
        
        
//        let request = URLRequest(url: url!)
//
//        webview.load(request)
      
    }
    
    override func didReceiveMemoryWarning() {
        didReceiveMemoryWarning()
    }
    
    

   

}
