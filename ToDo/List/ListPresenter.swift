//
//  ListPresenter.swift
//  ToDo
//
//  Created by NHN on 2023/03/28.
//

import Foundation
import UIKit

protocol ListPresenterable: AnyObject {
    func totalCount() -> Int
    func todo(at index: Int) -> ToDo?
}

class ListPresenter: ListPresenterable {
    
    let dataStorage: TodoDataManagerProtocol
    
    init(dataStorage: TodoDataManagerProtocol) {
        self.dataStorage = dataStorage
    }
    
    func totalCount() -> Int {
        self.dataStorage.toDoCount()
    }
    
    func todo(at index: Int) -> ToDo? {
        self.dataStorage.arrayToDo()[index]
    }
}
