//
//  ViewController.swift
//  RxSwiftExamples
//
//  Created by Milandr on 30.10.2020.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let disposeBag = DisposeBag()
    private var viewModel: RestaurantsListViewModel! // it must work only with it!
    
    static func instantiate(viewModel: RestaurantsListViewModel) -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.contentInsetAdjustmentBehavior = .never
        
        viewModel.fetchRestaurantViewModels()
            .bind(to: tableView.rx.items(cellIdentifier: "cell")) { index, viewModel, cell in
                cell.textLabel?.text = viewModel.displayText
            }.disposed(by: disposeBag)
    }


}

