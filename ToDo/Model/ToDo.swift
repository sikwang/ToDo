//
//  ToDo.swift
//  ToDo
//
//  Created by NHN on 2023/03/29.
//

import Foundation

struct ToDo {
    let id: String = UUID().uuidString
    var text: String
    var isCompleted: Bool
}
