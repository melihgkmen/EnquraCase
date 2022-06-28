//
//  ProfileCoordinator.swift
//  EnquraCase
//
//  Created by Melih Gökmen on 28.06.2022.
//

import Foundation
import UIKit
import RxSwift


class ProfileCoordinator: ReactiveCoordinator<Void> {
    private let rootViewController: UIViewController
    private let navigationController: UINavigationController
    
    init(rootViewController: UIViewController, navigationController: UINavigationController) {
        self.rootViewController = rootViewController
        self.navigationController = navigationController
    }
    override func start() -> Observable<Void> {
        let vc  = ProfileVC()
        let vm = ProfileVM()
        vc.viewModel = vm
        
        navigationController.setNavigationBarHidden(true, animated: true)
        navigationController.setViewControllers([vc], animated: true)
        return Observable.never()
    }
}
