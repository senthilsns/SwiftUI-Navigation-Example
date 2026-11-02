//
//  FirstViewModel.swift
//  NavigationExample
//
//  Created by senthil on 07/10/26.
//

import Foundation
import Observation

@Observable
class FirstViewModel {
    
    var post: [FirstModel] = []
    var isLoading: Bool = false
    var errorMsg: String? = nil
    
    func fetchPosts() async {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            errorMsg = "Invalid URL"
            return }
        
        do {
            
            isLoading = true
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
                errorMsg = "Server Error"
                isLoading = false
                return
            }
            
            let posts = try JSONDecoder().decode([FirstModel].self, from: data)
            post = posts
            isLoading = false
            
        } catch {
            isLoading = false
            errorMsg = error.localizedDescription
        }
        
    }
    
}
