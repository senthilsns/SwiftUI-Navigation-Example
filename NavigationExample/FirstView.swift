//
//  FirstView.swift
//  POC
//
//  Created by senthil on 05/10/26.
//

import SwiftUI

struct FirstView: View {
    
    @StateObject var navManager: NavigationManager = NavigationManager()
    
    var body: some View {

        NavigationStack(path: $navManager.path) {
            VStack {
                                
                PrimaryButton(title: "Go to Second", action: {
                    navManager.navigate(to: "second")
                })
                
            }
            .navigationDestination(for: String.self, destination: { item in
                
                switch item{
                    
                    case "second":
                    SecondView(title: "second")
                        .environmentObject(navManager)
                    case "third":
                    ThirdView(title: "third")
                        .environmentObject(navManager)
                    case "fourth":
                    FourthView(title: "fourth")
                        .environmentObject(navManager)
                default:
                    Text("Unknown view \(item)")
                }                
                
            })
            .navigationTitle("First View")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct ButtonStyle: ViewModifier {

    func body(content: Content) -> some View {
        content
            .frame(width: 200, height: 50)
            .background(Color.red)
            .foregroundStyle(Color.white)
            .cornerRadius(10)
    }
}

extension View {
    func customStyle() -> some View {
        modifier(ButtonStyle())
    }
}


#Preview {
    FirstView()
}
