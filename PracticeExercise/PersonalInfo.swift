//
//  PersonalInfo.swift
//  PracticeExercise
//
//  Created by User on 12/1/21.
//

import Foundation

struct PersonalInfo: Codable {
    let name: String
    let phone : String
    let email: String
    let id: Int
}

struct ToDoInfo: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}
