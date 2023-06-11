//
//  ViewController.swift
//  Mottle
//
//  Created by Hamza Bella on 09/05/2023.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    
    var imageView: UIImageView = {
        
        let imageView = UIImageView(frame: CGRect(x:0, y:0, width: 370, height: 370))
        imageView.image = UIImage(named: "logo")
        return imageView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        // Pour désactiver le clavier sur la vue principale (view)
        view.endEditing(true)

    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.animation()
        }
    }
    
    
    func animation(){
        UIView.animate(withDuration: 1){
            let size = self.view.frame.size.width * 2
            let xposition = size - self.view.frame.width - size
            let yposition = self.view.frame.height - size
            
            self.imageView.frame = CGRect(x: -(xposition/2), y: yposition, width: size, height: size)
            self.imageView.alpha = 0
        }
    }
    
    
     override func prepare(for segue: UIStoryboardSegue,sender: Any?){
         if segue.identifier == "HomeToGame" {
             // Definition du controler de destinatation
             let gameview = segue.destination as! GameView
         }
      }
    
    
}

