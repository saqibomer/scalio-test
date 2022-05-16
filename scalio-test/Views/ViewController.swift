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
    @IBOutlet weak var searchBar: UISearchBar!
    
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
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Github users"
        configureTableView()
        configureSearchBar()
        
        
    }
    
    private func configureTableView() {
        registerCell()
        tableView.rowHeight = 90
        
    }
    
    private func registerCell() {
        self.tableView.register(UINib(nibName: UserTableViewCell.Identifier, bundle: nil), forCellReuseIdentifier: UserTableViewCell.Identifier)
    }
    
    private func configureSearchBar() {
        searchBar.delegate = self
    }
    
    
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let vm = viewModel else {return}
        let queryString = searchBar.text?.lowercased() ?? ""
        if queryString.count > 2 {
            self.tableView.delegate = nil
            self.tableView.dataSource = nil
            vm.fetchUsersViewModel(query: queryString).observe(on: MainScheduler.instance).bind(to: self.tableView.rx.items(cellIdentifier: UserTableViewCell.Identifier, cellType: UserTableViewCell.self)) { index, viewmodel, cell in
                cell.user = viewmodel.user
            }.disposed(by: disposeBag)
        }
    }
}

