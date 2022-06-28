//
//  SplashCoordinator.swift
//  EnquraCase
//
//  Created by Melih Gökmen on 28.06.2022.
//

import Foundation
import UIKit
import RxSwift

class SplashCoordinator: ReactiveCoordinator<Void> {
    let rootViewController: UIViewController
       
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    override func start() -> Observable<Void> {
        let vc = rootViewController as! SplashVC
        let vm = SplashVM()
        vc.viewModel = vm
        
        vm.splashEnd.subscribe { _ in
          let _ = self.coordinate(to: TabBarCoordinator(rootViewController: vc))
        }.disposed(by: disposeBag)

        return Observable.never()
    }
}
