//
//  FirstModel.swift
//  NavigationExample
//
//  Created by senthil on 07/10/26.
//


import Foundation

struct FirstModel: Codable, Identifiable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
