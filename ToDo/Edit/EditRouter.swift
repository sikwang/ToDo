//
//  EditRouter.swift
//  ToDo
//
//  Created by NHN on 2023/03/29.
//

import Foundation
import UIKit

protocol EditRouterable: AnyObject {
    func moveToBack()
}

class EditRouter: EditRouterable {
    
    weak var sourceViewController: UIViewController? = nil
    
    func moveToBack() {
        if let navigationController = self.sourceViewController?.navigationController {
            navigationController.popViewController(animated: true)
        } else {
            self.sourceViewController?.dismiss(animated: true)
        }
    }
}
