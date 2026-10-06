//
//  FourthView.swift
//  POC
//
//  Created by senthil on 05/10/26.
//

import SwiftUI

struct FourthView: View {
    @EnvironmentObject var navManager: NavigationManager
    var title: String
    
    var body: some View {
        VStack {
            Text("Detail view for \(title)")
                 
            PrimaryButton(title: "Pop to Third", action: {
                navManager.popTo("third")
            })
            
            
               }
        .navigationTitle("Fourth View")
        .navigationBarTitleDisplayMode(.inline)    }
}

#Preview {
    FourthView(title: "Fourth")
}
