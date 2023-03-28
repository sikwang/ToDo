//
//  ListViewController.swift
//  ToDo
//
//  Created by NHN on 2023/03/28.
//

import UIKit
import SnapKit

protocol ListViewControllerable: AnyObject {
    func onClickAdd()
}

final class ListViewController: UITableViewController, ListViewControllerable {
    
    let router: ListRouterable
    let presenter: ListPresenterable
   
    init(router: ListRouterable, presenter: ListPresenterable) {
        self.router = router
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    private lazy var addButton: UIButton = {
        var button = UIButton(primaryAction: UIAction(handler: { [weak self] _ in
            self?.onClickAdd()
        }))
        button.setImage(.add, for: .normal)
        return button
    }()
    
    private lazy var label: UILabel = {
        var label = UILabel()
        label.text = "To Do List"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    override func viewDidLoad() {
        self.extendedLayoutIncludesOpaqueBars = true
        self.tableView.register(ToDoCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ToDoCell
        if let todo = self.presenter.todo(at: indexPath.row) {
            cell.configure(with: todo)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.presenter.totalCount()
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.addSubview(self.label)
        headerView.addSubview(self.addButton)
        
        self.label.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
        self.addButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
            make.size.equalTo(20)
        }
        
        return headerView
    }
    
    @objc func onClickAdd() {
        self.router.moveToEdit(didSave: { [weak self] in
            self?.tableView.reloadData()
        })
    }
}
