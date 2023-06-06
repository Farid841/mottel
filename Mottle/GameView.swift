//
//  GameView.swift
//  Mottle
//
//  Created by Hamza Bella on 09/05/2023.
//

import UIKit
import SwiftUI
import SpriteKit


// creation de la classe me permettant d'afficher par dessous le view
class ParticleScene: SKScene {

    override init(size: CGSize) {
        super.init(size: size)

        backgroundColor = .clear

        if let emitter1 = SKEmitterNode(fileNamed: "MyParticle-2") {
            emitter1.position.y = size.height
            emitter1.particleColorSequence = nil
            emitter1.particleColorBlendFactor = 1
            emitter1.particleColorBlueRange = 1
            emitter1.particleColorGreenRange = 1
            emitter1.particleColorRedRange = 1
            emitter1.position.x = size.width
            addChild(emitter1)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

class GameView: UIViewController {
    
    let partie = Partie.init()
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
    
    // fonction de l'animation
    func showWinningEffect(on view: SKView) {
           
           let scene = SKScene(size: view.bounds.size)
           scene.scaleMode = .aspectFill
           
           if let particleScene = SKScene(fileNamed: "Myparticule-2") {
               
               if let confettiEmitter = particleScene.childNode(withName: "confettiEmitter") as? SKEmitterNode {
                   
                   confettiEmitter.position =
                   CGPoint(x: scene.size.width / 2, y: scene.size.height / 2)
                   confettiEmitter.targetNode = scene
                   confettiEmitter.numParticlesToEmit = 1000
                   confettiEmitter.particleBirthRate = 300
                   confettiEmitter.particleLifetime = 5
                   confettiEmitter.particleSpeed = 500
                   confettiEmitter.particleSpeedRange = 100
                   confettiEmitter.particleAlpha = 1.0
                   confettiEmitter.particleAlphaRange = 0.5
                   confettiEmitter.particleScale = 0.5
                   confettiEmitter.particleScaleRange = 0.3
                   confettiEmitter.particleScaleSpeed = -0.1
                   confettiEmitter.particleColorBlendFactor = 1.0
                   confettiEmitter.particleColorSequence = nil
                   confettiEmitter.particleColorBlendFactorSequence = nil
                   confettiEmitter.particleColor = UIColor.red
                   confettiEmitter.particleColorRedRange = 1.0
                   confettiEmitter.particleColorGreenRange = 1.0
                   confettiEmitter.particleColorBlueRange = 1.0
                   
                   scene.addChild(confettiEmitter)
                   
               }
           }
           view.presentScene(scene)
       }

    
    func finPartie(statut : String){
        
        switch statut {
                case "gagné" : label.text = "Gagné"
                               btnRejouter.isHidden = false
                               let skView = SKView(frame: view.bounds)
                               let particleScene = ParticleScene(size: skView.bounds.size)

                               skView.presentScene(particleScene)
                               skView.alpha = 0.0

                              view.addSubview(skView)

                             UIView.animate(withDuration: 1.0, animations: {
                                 skView.alpha = 1.0
                             }) { _ in
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                        UIView.animate(withDuration: 1.0) {
                                            skView.alpha = 0.0
                                        } completion: { _ in
                                            skView.removeFromSuperview()
                                        }
                                    }
                                }

                               
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
    
