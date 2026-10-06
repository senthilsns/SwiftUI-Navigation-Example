//
//  SecondView.swift
//  POC
//
//  Created by senthil on 05/10/26.
//

import SwiftUI

struct SecondView: View {
    
    @EnvironmentObject var navManager: NavigationManager
    var title: String
    
    var body: some View {
        
        VStack{
            
            PrimaryButton(title: "Go to Third View", action: {
                navManager.navigate(to: "third")
            })
            
        }
        .navigationTitle("Second View")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SecondView(title: "Second")
}
