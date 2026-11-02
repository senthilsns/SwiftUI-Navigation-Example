//
//  SecondViewModel.swift
//  NavigationExample
//
//  Created by senthil on 14/10/26.
//

import Foundation
import Observation
import Combine

@Observable
class SecondViewModel {
    
    var posts: [SecondModel] = []
    private var cancellables = Set<AnyCancellable>()
    var isLoading: Bool = false
    var errorMessage: String? = nil
    
    func fetchDetails() async {
        
        guard let url = URL(string: "https://fakestoreapi.com/products") else { return }
        isLoading = true
        errorMessage = nil
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [SecondModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    break
                }
                
            }, receiveValue: {[weak self] post in
                
                self?.posts = post
             
            })
            .store(in: &cancellables)
    }
    
}
