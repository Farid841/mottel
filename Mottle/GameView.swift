//
//  GameView.swift
//  Mottle
//
//  Created by Hamza Bella on 09/05/2023.
//

import UIKit
import SwiftUI

class GameView: UIViewController {

    override func viewDidLoad() {
    
        
    }
    @IBSegueAction func GameCells(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: SwiftUIView())
    }
    
}
    
