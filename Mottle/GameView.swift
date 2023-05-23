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
    var nbTours : Int = 0

    

    @IBOutlet weak var input1: UITextField!
    @IBOutlet weak var input2: UITextField!
    @IBOutlet weak var input3: UITextField!
    @IBOutlet weak var input4: UITextField!
    @IBOutlet weak var input5: UITextField!
    @IBOutlet weak var input6: UITextField!
    @IBOutlet weak var input7: UITextField!
    @IBOutlet weak var input8: UITextField!
    @IBOutlet weak var input9: UITextField!
    @IBOutlet weak var input10: UITextField!
   
    @IBOutlet weak var input11: UITextField!
    @IBOutlet weak var input12: UITextField!
    @IBOutlet weak var input13: UITextField!
    @IBOutlet weak var input14: UITextField!
    @IBOutlet weak var input15: UITextField!
    @IBOutlet weak var input16: UITextField!
    
    @IBOutlet weak var input25: UITextField!
    @IBOutlet weak var input24: UITextField!
    @IBOutlet weak var input23: UITextField!
    @IBOutlet weak var input22: UITextField!
    @IBOutlet weak var input21: UITextField!
    @IBOutlet weak var input20: UITextField!
    @IBOutlet weak var input19: UITextField!
    @IBOutlet weak var input18: UITextField!
    @IBOutlet weak var input17: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBAction func verif1mot(_ sender: Any) {
        
        let mot = partie.motChoisi
        
        switch (nbTours){
        case 0 :
            var motduUser = "\(input1.text!)\(input2.text!)\(input3.text!)\(input4.text!)\(input5.text!)"
            motduUser = motduUser.uppercased()
            if(motduUser.count == 5) {
        
                nbTours = nbTours + 1
                if(mot == motduUser){
                    input1.backgroundColor = UIColor.green
                    input2.backgroundColor = UIColor.green
                    input3.backgroundColor = UIColor.green
                    input4.backgroundColor = UIColor.green
                    input5.backgroundColor = UIColor.green
                    label.text = "Gagné"
                    print("gagné")
                }else{
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
        
    case 1:
            var motduUser = "\(input6.text!)\(input7.text!)\(input8.text!)\(input9.text!)\(input10.text!)"
            motduUser = motduUser.uppercased()
        if(motduUser.count == 5) {
            nbTours = nbTours + 1
            if(mot == motduUser){
                print("gagné")
                input6.backgroundColor = UIColor.green
                input7.backgroundColor = UIColor.green
                input8.backgroundColor = UIColor.green
                input9.backgroundColor = UIColor.green
                input10.backgroundColor = UIColor.green
                label.text = "Gagné"
            }else{
                
           
            for i in 0...4 {
                if(mot[mot.index(mot.startIndex, offsetBy: i)] == motduUser[motduUser.index(motduUser.startIndex, offsetBy: i)] ){
                    
                    print("OK pour la lettre \(motduUser[motduUser.index(motduUser.startIndex, offsetBy: i)])")
                    switch (i){
                    case 0 : input6.backgroundColor = UIColor.green
                        input6.isEnabled = false
                        input6.isUserInteractionEnabled = false
                    case 1 : input7.backgroundColor = UIColor.green
                        input7.isEnabled = false
                        input7.isUserInteractionEnabled = false
                    case 2:input8.backgroundColor = UIColor.green
                        input8.isEnabled = false
                        input8.isUserInteractionEnabled = false
                    case 3:input9.backgroundColor = UIColor.green
                        input9.isEnabled = false
                        input9.isUserInteractionEnabled = false
                    case 4:input10.backgroundColor = UIColor.green
                        input10.isEnabled = false
                        input10.isUserInteractionEnabled = false
                    default: print("erreur de changement de couleur")
                    }
                }else if (mot.contains(motduUser[motduUser.index(motduUser.startIndex, offsetBy: i)])){
                    switch (i){
                    case 0 : input6.backgroundColor = UIColor.orange
                        input6.isEnabled = false
                        input6.isUserInteractionEnabled = false
                    case 1 : input7.backgroundColor = UIColor.orange
                        input7.isEnabled = false
                        input7.isUserInteractionEnabled = false
                    case 2:input8.backgroundColor = UIColor.orange
                        input8.isEnabled = false
                        input8.isUserInteractionEnabled = false
                    case 3:input9.backgroundColor = UIColor.orange
                        input9.isEnabled = false
                        input9.isUserInteractionEnabled = false
                    case 4:input10.backgroundColor = UIColor.orange
                        input10.isEnabled = false
                        input10.isUserInteractionEnabled = false
                    default: print("erreur de changement de couleur")
                    }
                    print("Le mot contient la lettre \(motduUser[motduUser.index(motduUser.startIndex, offsetBy: i)])")
                }
                else{
                    switch(i){
                    case 0 : input6.backgroundColor = UIColor.gray
                        input6.isEnabled = false
                        input6.isUserInteractionEnabled = false
                    case 1 : input7.backgroundColor = UIColor.gray
                        input7.isEnabled = false
                        input7.isUserInteractionEnabled = false
                    case 2:input8.backgroundColor = UIColor.gray
                        input8.isEnabled = false
                        input8.isUserInteractionEnabled = false
                    case 3:input9.backgroundColor = UIColor.gray
                        input9.isEnabled = false
                        input9.isUserInteractionEnabled = false
                    case 4:input10.backgroundColor = UIColor.gray
                        input10.isEnabled = false
                        input10.isUserInteractionEnabled = false
                    default: print("erreur de changement de couleur")
                    }
                }
            }
           
            }
        }
        case 2 :
            var motduUser = "\(input11.text!)\(input12.text!)\(input13.text!)\(input14.text!)\(input15.text!)"
            motduUser = motduUser.uppercased()
        if(motduUser.count == 5) {
            nbTours = nbTours + 1
            if(mot == motduUser){
                print("gagné")
                input11.backgroundColor = UIColor.green
                input12.backgroundColor = UIColor.green
                input13.backgroundColor = UIColor.green
                input14.backgroundColor = UIColor.green
                input15.backgroundColor = UIColor.green
                label.text = "Gagné"
            }else{
                
           
            for i in 0...4 {
                if(mot[mot.index(mot.startIndex, offsetBy: i)] == motduUser[motduUser.index(motduUser.startIndex, offsetBy: i)] ){
                    
                    print("OK pour la lettre \(motduUser[motduUser.index(motduUser.startIndex, offsetBy: i)])")
                    switch (i){
                    case 0 : input11.backgroundColor = UIColor.green
                        input11.isEnabled = false
                        input11.isUserInteractionEnabled = false
                    case 1 : input12.backgroundColor = UIColor.green
                        input12.isEnabled = false
                        input12.isUserInteractionEnabled = false
                    case 2:input13.backgroundColor = UIColor.green
                        input13.isEnabled = false
                        input13.isUserInteractionEnabled = false
                    case 3:input14.backgroundColor = UIColor.green
                        input14.isEnabled = false
                        input14.isUserInteractionEnabled = false
                    case 4:input15.backgroundColor = UIColor.green
                        input15.isEnabled = false
                        input15.isUserInteractionEnabled = false
                    default: print("erreur de changement de couleur")
                    }
                }else if (mot.contains(motduUser[motduUser.index(motduUser.startIndex, offsetBy: i)])){
                    switch (i){
                    case 0 : input11.backgroundColor = UIColor.orange
                        input11.isEnabled = false
                        input11.isUserInteractionEnabled = false
                    case 1 : input12.backgroundColor = UIColor.orange
                        input12.isEnabled = false
                        input12.isUserInteractionEnabled = false
                    case 2:input13.backgroundColor = UIColor.orange
                        input13.isEnabled = false
                        input13.isUserInteractionEnabled = false
                    case 3:input14.backgroundColor = UIColor.orange
                        input14.isEnabled = false
                        input14.isUserInteractionEnabled = false
                    case 4:input15.backgroundColor = UIColor.orange
                        input15.isEnabled = false
                        input15.isUserInteractionEnabled = false
                    default: print("erreur de changement de couleur")
                    }
                    print("Le mot contient la lettre \(motduUser[motduUser.index(motduUser.startIndex, offsetBy: i)])")
                }
                else{
                    switch(i){
                    case 0 : input11.backgroundColor = UIColor.gray
                        input11.isEnabled = false
                        input11.isUserInteractionEnabled = false
                    case 1 : input12.backgroundColor = UIColor.gray
                        input12.isEnabled = false
                        input12.isUserInteractionEnabled = false
                    case 2:input13.backgroundColor = UIColor.gray
                        input13.isEnabled = false
                        input13.isUserInteractionEnabled = false
                    case 3:input14.backgroundColor = UIColor.gray
                        input14.isEnabled = false
                        input14.isUserInteractionEnabled = false
                    case 4:input15.backgroundColor = UIColor.gray
                        input15.isEnabled = false
                        input15.isUserInteractionEnabled = false
                    default: print("erreur de changement de couleur")
                    }
                }
            }
           
            }
        }
        case 3 :var motduUser = "\(input16.text!)\(input17.text!)\(input18.text!)\(input19.text!)\(input20.text!)"
            motduUser = motduUser.uppercased()
            if(motduUser.count == 5) {
                nbTours = nbTours + 1
                if(mot == motduUser){
                    print("gagné")
                    input16.backgroundColor = UIColor.green
                    input17.backgroundColor = UIColor.green
                    input18.backgroundColor = UIColor.green
                    input19.backgroundColor = UIColor.green
                    input20.backgroundColor = UIColor.green
                    label.text = "Gagné"
                }else{
                    
               
                for i in 0...4 {
                    if(mot[mot.index(mot.startIndex, offsetBy: i)] == motduUser[motduUser.index(motduUser.startIndex, offsetBy: i)] ){
                        
                        print("OK pour la lettre \(motduUser[motduUser.index(motduUser.startIndex, offsetBy: i)])")
                        switch (i){
                        case 0 : input16.backgroundColor = UIColor.green
                            input16.isEnabled = false
                            input16.isUserInteractionEnabled = false
                        case 1 : input17.backgroundColor = UIColor.green
                            input17.isEnabled = false
                            input17.isUserInteractionEnabled = false
                        case 2:input18.backgroundColor = UIColor.green
                            input18.isEnabled = false
                            input18.isUserInteractionEnabled = false
                        case 3:input19.backgroundColor = UIColor.green
                            input19.isEnabled = false
                            input19.isUserInteractionEnabled = false
                        case 4:input20.backgroundColor = UIColor.green
                            input20.isEnabled = false
                            input20.isUserInteractionEnabled = false
                        default: print("erreur de changement de couleur")
                        }
                    }else if (mot.contains(motduUser[motduUser.index(motduUser.startIndex, offsetBy: i)])){
                        switch (i){
                        case 0 : input16.backgroundColor = UIColor.orange
                            input16.isEnabled = false
                            input16.isUserInteractionEnabled = false
                        case 1 : input17.backgroundColor = UIColor.orange
                            input17.isEnabled = false
                            input17.isUserInteractionEnabled = false
                        case 2:input18.backgroundColor = UIColor.orange
                            input18.isEnabled = false
                            input18.isUserInteractionEnabled = false
                        case 3:input19.backgroundColor = UIColor.orange
                            input19.isEnabled = false
                            input19.isUserInteractionEnabled = false
                        case 4:input20.backgroundColor = UIColor.orange
                            input20.isEnabled = false
                            input20.isUserInteractionEnabled = false
                        default: print("erreur de changement de couleur")
                        }
                        print("Le mot contient la lettre \(motduUser[motduUser.index(motduUser.startIndex, offsetBy: i)])")
                    }
                    else{
                        switch(i){
                        case 0 : input16.backgroundColor = UIColor.gray
                            input16.isEnabled = false
                            input16.isUserInteractionEnabled = false
                        case 1 : input17.backgroundColor = UIColor.gray
                            input17.isEnabled = false
                            input17.isUserInteractionEnabled = false
                        case 2:input18.backgroundColor = UIColor.gray
                            input18.isEnabled = false
                            input18.isUserInteractionEnabled = false
                        case 3:input19.backgroundColor = UIColor.gray
                            input19.isEnabled = false
                            input19.isUserInteractionEnabled = false
                        case 4:input20.backgroundColor = UIColor.gray
                            input20.isEnabled = false
                            input20.isUserInteractionEnabled = false
                        default: print("erreur de changement de couleur")
                        }
                    }
                }
               
                }
            }
            
        case 4 :var motduUser = "\(input21.text!)\(input22.text!)\(input23.text!)\(input24.text!)\(input25.text!)"
            motduUser = motduUser.uppercased()
            if(motduUser.count == 5) {
                nbTours = nbTours + 1
                
                if(mot == motduUser){
                    input21.backgroundColor = UIColor.green
                    input22.backgroundColor = UIColor.green
                    input23.backgroundColor = UIColor.green
                    input24.backgroundColor = UIColor.green
                    input25.backgroundColor = UIColor.green
                    label.text = "Gagné"
                    
                    print("gagné")
                }else{
                    
               
                for i in 0...4 {
                    if(mot[mot.index(mot.startIndex, offsetBy: i)] == motduUser[motduUser.index(motduUser.startIndex, offsetBy: i)] ){
                        
                        print("OK pour la lettre \(motduUser[motduUser.index(motduUser.startIndex, offsetBy: i)])")
                        switch (i){
                        case 0 : input21.backgroundColor = UIColor.green
                            input21.isEnabled = false
                            input21.isUserInteractionEnabled = false
                        case 1 : input22.backgroundColor = UIColor.green
                            input22.isEnabled = false
                            input22.isUserInteractionEnabled = false
                        case 2:input23.backgroundColor = UIColor.green
                            input23.isEnabled = false
                            input23.isUserInteractionEnabled = false
                        case 3:input24.backgroundColor = UIColor.green
                            input24.isEnabled = false
                            input24.isUserInteractionEnabled = false
                        case 4:input25.backgroundColor = UIColor.green
                            input25.isEnabled = false
                            input25.isUserInteractionEnabled = false
                        default: print("erreur de changement de couleur")
                        }
                    }else if (mot.contains(motduUser[motduUser.index(motduUser.startIndex, offsetBy: i)])){
                        switch (i){
                        case 0 : input21.backgroundColor = UIColor.orange
                            input21.isEnabled = false
                            input21.isUserInteractionEnabled = false
                        case 1 : input22.backgroundColor = UIColor.orange
                            input22.isEnabled = false
                            input22.isUserInteractionEnabled = false
                        case 2:input23.backgroundColor = UIColor.orange
                            input23.isEnabled = false
                            input23.isUserInteractionEnabled = false
                        case 3:input24.backgroundColor = UIColor.orange
                            input24.isEnabled = false
                            input24.isUserInteractionEnabled = false
                        case 4:input25.backgroundColor = UIColor.orange
                            input25.isEnabled = false
                            input25.isUserInteractionEnabled = false
                        default: print("erreur de changement de couleur")
                        }
                        print("Le mot contient la lettre \(motduUser[motduUser.index(motduUser.startIndex, offsetBy: i)])")
                    }
                    else{
                        switch(i){
                        case 0 : input21.backgroundColor = UIColor.gray
                            input21.isEnabled = false
                            input21.isUserInteractionEnabled = false
                        case 1 : input22.backgroundColor = UIColor.gray
                            input22.isEnabled = false
                            input22.isUserInteractionEnabled = false
                        case 2:input23.backgroundColor = UIColor.gray
                            input23.isEnabled = false
                            input23.isUserInteractionEnabled = false
                        case 3:input24.backgroundColor = UIColor.gray
                            input24.isEnabled = false
                            input24.isUserInteractionEnabled = false
                        case 4:input20.backgroundColor = UIColor.gray
                            input20.isEnabled = false
                            input20.isUserInteractionEnabled = false
                        default: print("erreur de changement de couleur")
                        }
                    }
                }
               
                }
            }
        default:  label.text = "Perdu, le mot était : \(mot)"

    }
        
        
        
     
        
    }
    override func viewDidLoad() {
    
        
    }
   
    
}
    
