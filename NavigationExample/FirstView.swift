//
//  FirstView.swift
//  POC
//
//  Created by senthil on 05/10/26.
//

import SwiftUI

struct FirstView: View {
    
    @Environment(NetworkManager.self) private var networkManager
    @StateObject var navManager: NavigationManager = NavigationManager()
    @State var fViewModel = FirstViewModel()
    @State private var dataLoaded = false

    var body: some View {

        NavigationStack(path: $navManager.path) {
            Group {
                
                if fViewModel.isLoading {
                    
                    ProgressView("Loading ....")
                }else if let error = fViewModel.errorMsg {
                    
                    if !networkManager.isConnected {
                        ContentUnavailableView("No Internet Connection", systemImage: "wifi.slash", description: Text("Please connect internet and try again"))
                            .foregroundStyle(Color.red)
                    }else {
                        ContentUnavailableView("Error", systemImage: "exclamationmark.triangle",description: Text(error))
                            .foregroundStyle(Color.red)
                    }
                    
                }else {
                    List(fViewModel.post) { item in
                        Text(String(item.id))
                            .foregroundStyle(Color.red)
                            .bold()
                        Text(item.title)
                            .font(.headline)
                        Text(item.body)
                        
                    }
                   
                }
              
                                
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
            .task {
            
                    await fViewModel.fetchPosts()
                
            }
           
        }
    }
}




#Preview {
    FirstView()
}
