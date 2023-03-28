//
//  EditInteractor.swift
//  ToDo
//
//  Created by NHN on 2023/03/28.
//

import Foundation
import UIKit

protocol EditInteractorable: AnyObject {
    func saveData(_ toDo: String)
}

class EditInteractor: EditInteractorable {
    
    let dataStorage: TodoDataManagerProtocol
    
    init(dataStorage: TodoDataManagerProtocol) {
        self.dataStorage = dataStorage
    }
    
    func saveData(_ toDo: String) {
        self.dataStorage.addTodo(toDo)
    }
}
