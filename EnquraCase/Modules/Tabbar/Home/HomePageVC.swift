//
//  HomePageVC.swift
//  EnquraCase
//
//  Created by Melih Gökmen on 28.06.2022.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import Firebase
import FirebaseAnalytics

class HomePageVC: UIViewController {
    
    @IBOutlet weak var srcBar: UISearchBar!
    @IBOutlet weak var bankTV: UITableView!
    
    private let searchController: UISearchController = {
        let controller: UISearchController = .init()
        controller.searchBar.placeholder = "Search"
        controller.obscuresBackgroundDuringPresentation = false
        return controller
    }()

    var viewModel: HomePageVM

    private let disposeBag: DisposeBag = .init()

  init(viewModel: HomePageVM = .init()) {
     self.viewModel = viewModel
      super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if Network.shared.isConnected {
            print("\nYou're connected\n")
        } else {
            let alert = UIAlertController(title: "Network", message: "You're not connected.", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
            print("\nYou're not connected\n")
        }
        navigationItem.searchController = searchController
        bankTV.dataSource = nil
        bankTV.register(BankListTVCell.self, forCellReuseIdentifier: "BankListTVCell")

        viewModel.banks
            .bind(to: bankTV.rx.items(cellIdentifier: "BankListTVCell", cellType: BankListTVCell.self)) { index, model, cell in
                cell.textLabel?.text = model.dcADRESADI
                cell.detailTextLabel?.text = model.dcILCE
            }
            .disposed(by: disposeBag)

        // Row
        bankTV.rx
            .modelSelected(BankListResponse.self)
            .subscribe(onNext: { bank in
                self.bankTV.deselectAllSelectedRows()
                let bankViewModel: DetailPageVM = .init(bank: bank)
                let bankController: DetailPageVC = .init(viewModel: bankViewModel)
                
                self.navigationController?.show(bankController, sender: self)
                Analytics.logEvent("detail_screen_opened", parameters: nil )
                //self.viewModel.goToDetail.onNext(())
            })
            .disposed(by: disposeBag)

        // Search
        srcBar.rx.text
            .orEmpty
            .throttle(.milliseconds(300), scheduler: MainScheduler.instance)
            .subscribe(onNext: { text in
                self.viewModel.search(text)
            })
            .disposed(by: disposeBag)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.refreshBanks()
    }
}
