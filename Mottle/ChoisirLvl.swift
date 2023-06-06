//
//  ChoisirLvl.swift
//  Mottle
//
//  Created by Ryan Ho on 06/06/2023.
//

import UIKit
import SwiftUI

class ChoisirLvl: UIViewController {
    
    let partie = Partie.init()
    var nbTours : Int = 0
    var caseNB : Int = 0
    var motduUser:String = ""
    var cases : [[UITextField]] = []
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet var premiereLigne: [UITextField]!
    @IBOutlet var secondeLigne: [UITextField]!
    @IBOutlet var troisiemeLigne: [UITextField]!
    @IBOutlet var quatriemeLigne: [UITextField]!
    @IBOutlet var cinquiemeLigne: [UITextField]!
    @IBOutlet weak var btnRejouter: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        
        cases.append(premiereLigne)
        cases.append(secondeLigne)
        cases.append(troisiemeLigne)
        cases.append(quatriemeLigne)
        cases.append(cinquiemeLigne)
        cases[0][0].becomeFirstResponder()
        btnRejouter.isHidden = true
        
    }
    
    
    
    
    @IBAction func restartGame(_ sender: Any) {
        for group in cases {
            for input in group{
                input.isEnabled = true
                input.text = ""
                input.backgroundColor = UIColor.white
                
            }
        }
        nbTours = 0
        caseNB = 0
        label.text = ""
        cases[0][0].becomeFirstResponder()
        btnRejouter.isHidden = true
        
    }
    
 
    @IBAction func prochaineCase(_ sender: Any) {
        caseNB  = caseNB + 1
        cases[nbTours][caseNB].becomeFirstResponder()
        
    }
    
    func finPartie(statut : String){
        
        switch statut {
                case "gagné" : label.text = "Gagné"
                               btnRejouter.isHidden = false
                case "perdu" : label.text = "Perdu"
                               btnRejouter.isHidden = false
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
                if(mot == motduUser){
                    finPartie(statut: "gagné")
                }else{
                    finPartie(statut: "perdu")
                }
                
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
     
        }
    }
    
}
    

