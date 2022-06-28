//
//  HomePageCoordinator.swift
//  EnquraCase
//
//  Created by Melih Gökmen on 28.06.2022.
//

import Foundation
import UIKit
import RxSwift

class HomePageCoordinator: ReactiveCoordinator<Void> {
    private let rootViewController: UIViewController
    private let navigationController: UINavigationController
    
    init(rootViewController: UIViewController, navigationController: UINavigationController) {
        self.rootViewController = rootViewController
        self.navigationController = navigationController
    }
    override func start() -> Observable<Void> {
        let vc  = HomePageVC()
        let vm = HomePageVM()
        vc.viewModel = vm
        
        vm.goToDetail.subscribe({_ in
           let _ = self.coordinate(to: DetailPageCoordinator(rootViewController: self.rootViewController, navigationController: self.navigationController))
        }).disposed(by: disposeBag)

        
        navigationController.setNavigationBarHidden(true, animated: true)
        navigationController.setViewControllers([vc], animated: true)
        return Observable.never()
    }
}
