//
//  Mots.swift
//  Mottle
//
//  Created by Hamza Bella on 09/05/2023.
//

import Foundation

class Mots: ObservableObject {
    var longueurMot : Int
    var motsValide:[String] = []
    init(length: Int){
        longueurMot = length
        guard
            let fichier = Bundle.main.url(forResource: "mots", withExtension: "txt"),
            let listeMots = try? String(contentsOf: fichier,encoding: .utf8)else{
            print("erreur de récupération des mots")
            return
        }
        for mot in listeMots.split(separator: "\n"){
            let motValide = String(mot)
            if motValide.count == longueurMot{
                motsValide.append(motValide.uppercased())
            }
        }
    }
}
