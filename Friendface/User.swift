//
//  User.swift
//  Friendface
//
//  Created by Biagio Ricci on 15/02/23.
//

import Foundation

struct Friend: Codable, Identifiable {
    var id: String
    var name: String
}

struct Result: Codable, Identifiable{
    var id: String
    var isActive: Bool
    var name: String
    var company: String
    var age: Int
    var address: String
    var about: String
    var registered: Date
    
    var friends: [Friend]
}
