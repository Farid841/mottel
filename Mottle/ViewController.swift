//
//  ViewController.swift
//  Mottle
//
//  Created by Hamza Bella on 09/05/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
     override func prepare(for segue: UIStoryboardSegue,sender: Any?){
         
         if segue.identifier == "HomeToGame" {
             // Definition du controler de destinatation
             let gameview = segue.destination as! GameView
         }
      }
     


}

