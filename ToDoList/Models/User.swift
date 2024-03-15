//
//  User.swift
//  ToDoList
//
//  Created by Akshay Kadam on 13/03/24.
//

import Foundation

struct User: Codable{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
