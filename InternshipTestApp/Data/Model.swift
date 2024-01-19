//
//  Model.swift
//  InternshipTestApp
//
//  Created by Oleg Arnaut  on 15.01.2024.
//

import Foundation

struct Result : Decodable{
    let status: String
    let result: Status
}


// MARK: - Result
struct Status: Decodable {
    let title: String
    let actionTitle: String
    let selectedActionTitle: String
    let list: [List]
}

// MARK: - List
struct List : Decodable {
    let id : String
    let title: String
    let description: String?
    let icon: String
    let price: String
    let isSelected: Bool
}

