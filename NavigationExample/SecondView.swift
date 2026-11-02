//
//  SecondView.swift
//  POC
//
//  Created by senthil on 05/10/26.
//

import SwiftUI
/////https://fakestoreapi.com/products
struct SecondView: View {
    
    @EnvironmentObject var navManager: NavigationManager
    var title: String
    var secondViewModel = SecondViewModel()
    
    var body: some View {
        
        VStack{
            
            List {
                
                ForEach(secondViewModel.posts) { item in
                    
                    HStack(spacing: 20){
                        AsyncImage(url: URL(string: item.image)){img in
                            switch img {
                            case .success(let image):
                                image
                                    .resizable()
                                
                                case .failure:
                                Image(systemName: "photo")
                                    .font(.largeTitle)
                            default:
                                ProgressView()
                            }
                        }
                            .frame(width: 100, height: 100)
                            .cornerRadius(6)
                            
                        VStack(spacing: 15){
                            Text(item.title)
                            Text(item.description)
                                .foregroundStyle(Color.gray)
                            
                            Text(item.rating.rate, format: .currency(code: "INR")  )
                                .foregroundStyle(Color.primary)
                                .font(.title2)
                                .frame(width: 200,height: 40)
                        }


                    }
                    // Forces the separator line to stretch to the very edge of the list
                                .alignmentGuide(.listRowSeparatorLeading) { d in
                                    d[.leading]
                                }
                    
                }
            }
                                  
            PrimaryButton(title: "Go to Third View", action: {
                navManager.navigate(to: "third")
            })
        }
        .navigationTitle("Second View")
        .navigationBarTitleDisplayMode(.inline)
        .task {
           await secondViewModel.fetchDetails()
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
    SecondView(title: "Second")
}
