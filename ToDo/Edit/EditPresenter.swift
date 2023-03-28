//
//  EditPresenter.swift
//  ToDo
//
//  Created by NHN on 2023/03/28.
//

import Foundation
import UIKit

protocol EditPresenterable: AnyObject {
    func saveToDo(_ toDo: String)
    
}

final class EditPresenter: EditPresenterable {

    let editInteractor: EditInteractorable
    
    init(editInteractor: EditInteractorable) {
        self.editInteractor = editInteractor
    }
    
    func saveToDo(_ toDo: String) {
        self.editInteractor.saveData(toDo)
    }
}
