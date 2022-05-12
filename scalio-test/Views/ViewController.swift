//
//  ViewController.swift
//  scalio-test
//
//  Created by TOxIC on 12/05/2022.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: UsersViewModel!
    let disposeBag = DisposeBag()
    static func instantiate(viewModel: UsersViewModel) -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyboard.instantiateInitialViewController() as! ViewController
        vc.viewModel = viewModel
        return vc
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        guard let vm = viewModel else {return}
        vm.fetchUsersViewModel().observe(on: MainScheduler.instance).bind(to: tableView.rx.items(cellIdentifier: UserTableViewCell.Identifier, cellType: UserTableViewCell.self)) { index, viewmodel, cell in
            cell.user = viewmodel.user
        }.disposed(by: disposeBag)
        
        
    }
    
    private func configureTableView() {
        registerCell()
        tableView.rowHeight = 90
        
    }
    
    private func registerCell() {
        self.tableView.register(UINib(nibName: UserTableViewCell.Identifier, bundle: nil), forCellReuseIdentifier: UserTableViewCell.Identifier)
    }
    
    
}

