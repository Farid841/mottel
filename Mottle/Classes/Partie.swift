//
//  Partie.swift
//  Mottle
//
//  Created by Hamza Bella on 09/05/2023.
//

import Foundation

class Partie {
    var liste_mots : Mots
    var longueurPartie = 5
    var motChoisi : String
    
    init(){
        liste_mots = Mots.init(length: longueurPartie)
        let nbMots = liste_mots.motsValide.count
        let motRandom = Int.random(in: 0..<nbMots)
        let mot = liste_mots.motsValide[motRandom]
        motChoisi = mot
        print(mot)
    }
}
