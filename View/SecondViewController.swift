//
//  SecondViewController.swift
//  FunWithFlags
//
//  Created by Laboratorio UNAM-Apple 02 on 6/11/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import AVKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var table = [videos]()
    var ref: DatabaseReference!

@IBOutlet weak var TableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference().child("videos")
        ref.observe(DataEventType.value, with: { (snapshot) in
            if snapshot.childrenCount > 0{

                self.table.removeAll()

                for video in snapshot.children.allObjects as! [DataSnapshot] {

                    let Object = video.value as? [String: AnyObject]
                    let Title = Object?["Title"]
                    let videoLink = Object?["link"]

                    let video = videos(Title: Title as! String, link: videoLink as! String)

                    self.table.append(video)
                    self.TableView.reloadData()
                }
            }


        })

    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return table.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "celda") as! videoTableViewCell

        let video: videos
        video = table[indexPath.row]
        cell.title.text = video.Title
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let videoURL = URL(string: table[indexPath.row].link!)
            else {
                return
        }

        let player = AVPlayer(url: videoURL)
        let cointroller = AVPlayerViewController()
        cointroller.player = player

        present(cointroller, animated: true)
        player.play()

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
