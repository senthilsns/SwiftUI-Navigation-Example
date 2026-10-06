//
//  ThirdView.swift
//  POC
//
//  Created by senthil on 05/10/26.
//

import SwiftUI

struct ThirdView: View {
    @EnvironmentObject var navManager: NavigationManager
    var title: String
    
    var body: some View {
        VStack{
                    
            PrimaryButton(title: "Go to Fourth View", action: {
                navManager.navigate(to: "fourth")
            })
            
        }
        .navigationTitle("Third View")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ThirdView(title: "Third")
}
