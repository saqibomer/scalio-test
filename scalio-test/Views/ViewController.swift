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
    
    private var viewModel: UsersViewModel?
    let disposeBag = DisposeBag()
    static func instantiate(viewModel: UsersViewModel) -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.viewModel = viewModel
        return vc
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.fetchUsersViewModel().observe(on: MainScheduler.instance).bind(to: tableView.rx.items(cellIdentifier: "Cell")) { index, viewmodel, cell in
            
            cell.textLabel?.text = viewmodel.user.login
            
        }.disposed(by: disposeBag)
    }


}

