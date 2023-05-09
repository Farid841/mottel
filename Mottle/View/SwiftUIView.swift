//
//  SwiftUIView.swift
//  Mottle
//
//  Created by Hamza Bella on 09/05/2023.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        
        
        RoundedRectangle(cornerRadius: 50/5.0)
            .stroke(Color(UIColor.label))
            .frame(width: 50, height: 50)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
