//
//  ListRouter.swift
//  ToDo
//
//  Created by NHN on 2023/03/29.
//

import UIKit

protocol ListRouterable: AnyObject{
    func moveToEdit(didSave: (() -> Void)?)
}

class ListRouter: ListRouterable {

    weak var sourceViewController: UIViewController? = nil
    
    func moveToEdit(didSave: (() -> Void)?) {
        let editInteractor = EditInteractor(dataStorage: ToDoManager.shared)
        let editPresenter = EditPresenter(editInteractor: editInteractor)
        let editRouter = EditRouter()
        let editViewController = EditViewController(presenter: editPresenter, router: editRouter, didSave: didSave)
        editRouter.sourceViewController = editViewController
        if let navigationController = self.sourceViewController?.navigationController {
            navigationController.pushViewController(editViewController, animated: true)
        } else {
            self.sourceViewController?.present(editViewController, animated: true)
        }
    }
}
