//
//  PrimaryButton.swift
//  NavigationExample
//
//  Created by senthil on 06/10/26.
//

import SwiftUI

struct PrimaryButton: View {
    
    var title: String
    var action: () -> Void
    
    var body: some View {
       
        Button(action: action) {
            Text(title)
            .frame(width: 200, height: 50)
            .bold()
            .font(.headline)
            .background(Color.red)
            .foregroundStyle(Color.white)
            .cornerRadius(10)
        }
        
    }
}

