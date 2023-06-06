//
//  GameView.swift
//  Mottle
//
//  Created by Hamza Bella on 09/05/2023.
//

import UIKit
import SwiftUI

class CustomUI : UIView {
    
}

class GameView: UIViewController {
    
    var partie = Partie.init()
    var nbTours : Int = 0
    var caseNB : Int = 0
    var motduUser:String = ""
    var cases : [[UITextField]] = []
    

    @IBOutlet weak var btnRejouter: UIButton!
    @IBOutlet var premiereLigne: [UITextField]!
    @IBOutlet var secondeLigne: [UITextField]!
    @IBOutlet var troisiemeLigne: [UITextField]!
    @IBOutlet var quatriemeLigne: [UITextField]!
    @IBOutlet var cinquiemeLigne: [UITextField]!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet var premiereRange: [UIButton]!
    @IBOutlet var secondeRange: [UIButton]!
    @IBOutlet var troisiemeRange: [UIButton]!
    override func viewDidLoad() {
        
        
        cases.append(premiereLigne)
        cases.append(secondeLigne)
        cases.append(troisiemeLigne)
        cases.append(quatriemeLigne)
        cases.append(cinquiemeLigne)
        cases[0][0].becomeFirstResponder()
        btnRejouter.isHidden = true
        cases[0][0].inputView = UIView()
        
        
        
    }
    
    
    

    @IBAction func test(_ sender: Any) {
        print("test restart")
    }
    
    @IBAction func restartGame(_ sender: Any) {
        print("restart")
        for group in cases {
            for input in group{
                input.isEnabled = false
                input.text = ""
                input.backgroundColor = UIColor.white
                
            }
        }
        partie = Partie.init()
        nbTours = 0
        caseNB = 0
        label.text = ""
        cases[0][0].becomeFirstResponder()
        cases[0][0].inputView = UIView()
        btnRejouter.isHidden = true
        
    }
    
    @IBAction func appuieLettre(_ sender: UIButton) {
        let lettre = sender.titleLabel
        
            cases[nbTours][caseNB].text = lettre?.text!
        if(caseNB < 4){
            prochaineCaseClavierVirtuel()
        }else{
          
            if(nbTours > 4 ){
                 finPartie(statut: "perdu")
             }else{
                 verifierMot(tour: nbTours)
                 nbTours = nbTours + 1;
                 caseNB = 0
     
             }
        }
    }
    func prochaineCaseClavierVirtuel(){
   
        caseNB  = caseNB + 1
        print(caseNB)
        cases[nbTours][caseNB].inputView = UIView()
        cases[nbTours][caseNB].becomeFirstResponder()
       
        
    }
    @IBAction func effacerlettre(_ sender: Any) {
        if(caseNB > 0){
            caseNB  = caseNB - 1
            print(caseNB)
            cases[nbTours][caseNB].text = ""
            cases[nbTours][caseNB].inputView = UIView()
            cases[nbTours][caseNB].becomeFirstResponder()
        
        }
    }
    
    @IBAction func prochaineCase(_ sender: Any) {
      
        caseNB  = caseNB + 1
        print(caseNB)
        cases[nbTours][caseNB].inputView = UIView()
        cases[nbTours][caseNB].becomeFirstResponder()
        
     
        
    }
    
    func finPartie(statut : String){
        
        switch statut {
                case "gagné" : label.text = "Gagné"
            print(btnRejouter.isEnabled)
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
                cases[tour+1][0].inputView = UIView()
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
    
