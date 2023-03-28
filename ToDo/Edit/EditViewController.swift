//
//  EditView.swift
//  ToDo
//
//  Created by NHN on 2023/03/28.
//

import UIKit

protocol EditViewControllerable: AnyObject {
    var didSave: (() -> Void)? { get set }
}

class EditViewController: UIViewController, UITextViewDelegate, EditViewControllerable {

    var presenter: EditPresenterable
    var router: EditRouterable
    var didSave: (() -> Void)?
    
    init(presenter: EditPresenterable, router: EditRouterable, didSave: (() -> Void)?) {
        self.presenter = presenter
        self.router = router
        self.didSave = didSave
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Write To Do"
        return label
    }()
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.text = "Write Here"
        textView.textColor = UIColor.lightGray
        return textView
    }()
    
    private lazy var backButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem(title: "<", image:UIImage(systemName: "chevron.backward"), target: self, action:#selector(onBack))
        return barButton
    }()
    
    private lazy var saveButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem(title: "Save", image:UIImage(systemName: "arrow.down.doc"), target: self, action:#selector(onSave))
        return barButton
    }()
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.textView)
        
        self.textView.delegate = self
        self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem = self.backButton
        self.navigationItem.rightBarButtonItem = self.saveButton
        
        self.titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(40)
        }
        self.textView.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom)
            make.bottom.trailing.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
    }
    
    @objc func onBack() {
        self.router.moveToBack()
    }
    
    @objc func onSave() {
        self.presenter.saveToDo(self.textView.text)
        self.didSave?()
        self.router.moveToBack()
    }
}
