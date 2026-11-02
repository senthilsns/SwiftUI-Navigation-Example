//
//  SecondModel.swift
//  NavigationExample
//
//  Created by senthil on 14/10/26.
//

import Foundation

struct SecondModel: Codable, Identifiable {
    
    var id: Int
    var title: String
    var price: Double
    var description: String
    var category: String
    var image: String
    var rating: Rating
    
}

struct Rating: Codable {
   
    var rate: Float
    var count: Int
}
