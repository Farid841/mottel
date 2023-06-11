//
//  ChoiceView.swift
//  Mottle
//
//  Created by Farid on 11/06/2023.
//

import UIKit

class ChoiceView: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
       
    @IBOutlet weak var picker: UIPickerView!
    
    // ajout de ligne dans le picker
    private let pickerData =
    [
        "Facile",
        "Moyen",
        "Difficile"
    ]

    override func viewDidLoad() {
        
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    // Retourne le nombre de colonnes dans le picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Retourne le nombre de lignes dans le picker
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count

    }
    
    // Affiche le contenu de chaque ligne du picker
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // Exécute une action lorsque l'utilisateur sélectionne une ligne dans le picker
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedValue = pickerData[row]
        // fait un print dans la console 
        print(selectedValue)
    }

   
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
