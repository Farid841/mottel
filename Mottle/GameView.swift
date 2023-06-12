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
    var estFrancais : Bool = false
    var nbindice : Int = 0
    var timer = Timer()
    var secondes = 0
    var minutes = 0
    var heures = 0
    var score = 0
   
    

    @IBOutlet weak var btnRejouter: UIButton!
    @IBOutlet var premiereLigne: [UITextField]!
    @IBOutlet var secondeLigne: [UITextField]!
    @IBOutlet var troisiemeLigne: [UITextField]!
    @IBOutlet var quatriemeLigne: [UITextField]!
    @IBOutlet var cinquiemeLigne: [UITextField]!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var indiceIndicateur: UILabel!
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
        indiceIndicateur.text = "Indice utilisé : 0/5";
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameView.updateTimer), userInfo: nil, repeats: true)
        
        scoreLabel.isHidden = true
        
    
       
        
        
        
    }
    
    @objc func updateTimer(){
        secondes += 1
        if(secondes == 60){
            minutes += 1
            secondes = 0
        }
        if(minutes == 60){
            heures += 1
            minutes = 0
        }
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
        nbindice = 0
        indiceIndicateur.text = "Indice utilisé : 0/5";
        secondes = 0
        minutes = 0
        heures = 0
        scoreLabel.isHidden = true
        scoreLabel.text = ""
        score = 0
        estFrancais = false
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameView.updateTimer), userInfo: nil, repeats: true)
        
        
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
                 if (estFrancais == false){
                 
                    
                     return
                 }else{
                     
                     nbTours = nbTours + 1;
                     caseNB = 0
                 }
     
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
            score = 5000 - (heures * 60 * 60 + minutes * 60 + secondes)
            if(nbindice > 0){
                score = score - (nbindice * 500)
            }
            if(score < 0){
                score = 0
            }
            
            scoreLabel.text = "Score : \(score)"
            scoreLabel.isHidden = false
                
                case "perdu" : label.text = "Perdu"
                               btnRejouter.isHidden = false
            score = 0
                
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
        let allMot  = partie.liste_mots.motsValide
        estFrancais = allMot.contains(motduUser)
        
        
        if (estFrancais == false){
            let alert = UIAlertController(title: "Bien essayé...", message: "Le mot n'est pas français", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                for input in self.cases[tour]{
                    input.text = ""
                }
                
               
                self.cases[tour][0].inputView = UIView()
                self.cases[tour][0].becomeFirstResponder()
                self.caseNB = 0
            
            }))
            if(self.nbindice < 4){
               
                
                
            alert.addAction(UIAlertAction(title: "Indice !", style: .default,handler: {
                action in for input in self.cases[tour]{
                                        
                    input.text = ""
                
                   
                }
                print("nombre de case : \(self.cases[tour].count)")
                if( self.nbindice == 0){
                    self.cases[tour][0].text = String(mot[mot.index(mot.startIndex, offsetBy: 0)])
                    self.cases[tour][1].inputView = UIView()
                    self.cases[tour][1].becomeFirstResponder()
                    self.caseNB = 1
                    
                    self.nbindice = 1
                    print(" nombre d'indice : \(self.nbindice)")
                    self.indiceIndicateur.text = "Indice utilisé : 1/5";
                }else{
                    self.nbindice = self.nbindice + 1
                
                        
                        for i in 0 ..< self.nbindice{
                            self.cases[tour][i].text = String(mot[mot.index(mot.startIndex, offsetBy: i)])
                            
                        }
                        self.nbindice = self.nbindice - 1
                        
                        self.cases[tour][self.nbindice+1].inputView = UIView()
                        self.cases[tour][self.nbindice+1].becomeFirstResponder()
                        self.caseNB = self.nbindice+1
                        
                        self.nbindice = self.nbindice + 1
                        self.indiceIndicateur.text = "Indice utilisé : \(self.nbindice)/5";
                
                    
                }
               
                
                
            
            
            
                }))
            }
          
            self.present(alert, animated: true)
        }else{
            
            
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
        
    }

    @IBAction func verif1mot(_ sender: Any) {
        if(nbTours > 4 ){
            finPartie(statut: "perdu")
        }else{
        verifierMot(tour: nbTours)
            if(estFrancais == false){
               
                return
            }else{
                nbTours = nbTours + 1;
                caseNB = 0
            }
        }
    }
    
}
    
