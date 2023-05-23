//
//  GameView.swift
//  Mottle
//
//  Created by Hamza Bella on 09/05/2023.
//

import UIKit
import SwiftUI

class GameView: UIViewController {
    
    let partie = Partie.init()

    

    @IBOutlet weak var input1: UITextField!
    @IBOutlet weak var input2: UITextField!
    @IBOutlet weak var input3: UITextField!
    @IBOutlet weak var input4: UITextField!
    @IBOutlet weak var input5: UITextField!
    
    @IBAction func verif1mot(_ sender: Any) {
        
        let motduUser = "\(input1.text!)\(input2.text!)\(input3.text!)\(input4.text!)\(input5.text!)"
        print(motduUser)
        
        if(motduUser.count == 5){
            let mot = partie.motChoisi
            for i in 0...4 {
                if(mot[mot.index(mot.startIndex, offsetBy: i)] == motduUser[motduUser.index(motduUser.startIndex, offsetBy: i)] ){
                    
                    print("OK pour la lettre \(motduUser[motduUser.index(motduUser.startIndex, offsetBy: i)])")
                    switch (i){
                    case 0 : input1.backgroundColor = UIColor.green
                        input1.isEnabled = false
                        input1.isUserInteractionEnabled = false
                    case 1 : input2.backgroundColor = UIColor.green
                        input2.isEnabled = false
                        input2.isUserInteractionEnabled = false
                    case 2:input3.backgroundColor = UIColor.green
                        input3.isEnabled = false
                        input3.isUserInteractionEnabled = false
                    case 3:input4.backgroundColor = UIColor.green
                        input4.isEnabled = false
                        input4.isUserInteractionEnabled = false
                    case 4:input5.backgroundColor = UIColor.green
                        input5.isEnabled = false
                        input5.isUserInteractionEnabled = false
                    default: print("erreur de changement de couleur")
                    }
                }else if (mot.contains(motduUser[motduUser.index(motduUser.startIndex, offsetBy: i)])){
                    switch (i){
                    case 0 : input1.backgroundColor = UIColor.orange
                        input1.isEnabled = false
                        input1.isUserInteractionEnabled = false
                    case 1 : input2.backgroundColor = UIColor.orange
                        input2.isEnabled = false
                        input2.isUserInteractionEnabled = false
                    case 2:input3.backgroundColor = UIColor.orange
                        input3.isEnabled = false
                        input3.isUserInteractionEnabled = false
                    case 3:input4.backgroundColor = UIColor.orange
                        input4.isEnabled = false
                        input4.isUserInteractionEnabled = false
                    case 4:input5.backgroundColor = UIColor.orange
                        input5.isEnabled = false
                        input5.isUserInteractionEnabled = false
                    default: print("erreur de changement de couleur")
                    }
                    print("Le mot contient la lettre \(motduUser[motduUser.index(motduUser.startIndex, offsetBy: i)])")
                }
                else{
                    switch(i){
                    case 0 : input1.backgroundColor = UIColor.gray
                        input1.isEnabled = false
                        input1.isUserInteractionEnabled = false
                    case 1 : input2.backgroundColor = UIColor.gray
                        input2.isEnabled = false
                        input2.isUserInteractionEnabled = false
                    case 2:input3.backgroundColor = UIColor.gray
                        input3.isEnabled = false
                        input3.isUserInteractionEnabled = false
                    case 3:input4.backgroundColor = UIColor.gray
                        input4.isEnabled = false
                        input4.isUserInteractionEnabled = false
                    case 4:input5.backgroundColor = UIColor.gray
                        input5.isEnabled = false
                        input5.isUserInteractionEnabled = false
                    default: print("erreur de changement de couleur")
                    }
                }
            }
        }
        
    }
    override func viewDidLoad() {
    
        
    }
   
    
}
    
