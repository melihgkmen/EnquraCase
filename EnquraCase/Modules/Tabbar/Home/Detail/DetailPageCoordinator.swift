//
//  DetailPageCoordinator.swift
//  EnquraCase
//
//  Created by Melih Gökmen on 28.06.2022.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class DetailPageCoordinator: ReactiveCoordinator<Void> {
    let rootViewController: UIViewController
    let navigationController: UINavigationController
       
    init(rootViewController: UIViewController, navigationController: UINavigationController) {
        self.rootViewController = rootViewController
        self.navigationController = navigationController
    }
    override func start() -> Observable<Void> {
        let vc = DetailPageVC()
        let vm = DetailPageVM()
        vc.viewModel = vm
        
        navigationController.pushViewController(vc, animated: true)
        return  Observable.never()
    }
    
    
}
