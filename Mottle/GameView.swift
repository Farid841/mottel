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
    var caseNB : Int = 0

    

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
    
    
//    @IBOutlet var premiereLigne:[UITextField]!
    @IBOutlet var premiereLigne: [UITextField]!
    @IBOutlet var secondeLigne: [UITextField]!
    @IBOutlet var troisiemeLigne: [UITextField]!
    @IBOutlet var quatriemeLigne: [UITextField]!
    @IBOutlet var cinquiemeLigne: [UITextField]!
    
    @IBOutlet weak var label: UILabel!
    
    var motduUser:String = ""
    
    
    var cases : [[UITextField]] = []
    
    override func viewDidLoad() {
        
        cases.append(premiereLigne)
        cases.append(secondeLigne)
        cases.append(troisiemeLigne)
        cases.append(quatriemeLigne)
        cases.append(cinquiemeLigne)
        cases[0][0].becomeFirstResponder()
        
    }
 
    @IBAction func prochaineCase(_ sender: Any) {
        caseNB  = caseNB + 1
        cases[nbTours][caseNB].becomeFirstResponder()
        print(nbTours)
    }
    
    func finPartie(statut : String){
        print("call")
        switch statut {
                case "gagné" : label.text = "Gagné"
                case "perdu" : label.text = "Perdu"
                default: label.text = "Erreur"
        }
    }
    
    func verifierMot(tour : Int){
        let mot = partie.motChoisi
        motduUser = ""
        
        for input in cases[tour]{
            motduUser.append(input.text!)
        }
        
        motduUser = motduUser.uppercased()
        
        print(motduUser)
        if(motduUser.count == 5) {
            if(mot == motduUser){
                finPartie(statut: "gagné")
                for group in cases {
                    for input in group{
                        input.isEnabled = false
                    }
                }
            }
            for i in 0...4 {
                if(mot[mot.index(mot.startIndex, offsetBy: i)] == motduUser[motduUser.index(motduUser.startIndex, offsetBy: i)] )
                {
                    cases[tour][i].backgroundColor = UIColor.green
                    cases[tour][i].isEnabled = false
                    cases[tour][i].isUserInteractionEnabled = false
                    
                }
                else if (mot.contains(motduUser[motduUser.index(motduUser.startIndex, offsetBy: i)]))
                {
                    cases[tour][i].backgroundColor = UIColor.orange
                    cases[tour][i].isEnabled = false
                    cases[tour][i].isUserInteractionEnabled = false
                    
                }
                else
                {
                    cases[tour][i].backgroundColor = UIColor.gray
                    cases[tour][i].isEnabled = false
                    cases[tour][i].isUserInteractionEnabled = false
                   
                }
            }
            if(tour < 4){
                cases[tour+1][0].becomeFirstResponder()
            }else{
                finPartie(statut: "perdu")
            }
            
            
        }
        
    }

    @IBAction func verif1mot(_ sender: Any) {
        if(nbTours > 4 ){
            finPartie(statut: "perdu")
        }else{
        verifierMot(tour: nbTours)
        nbTours = nbTours + 1;
        caseNB = 0
        print(nbTours)
        }
    }
    
}
    
