//
//  AppCoordinator.swift
//  EnquraCase
//
//  Created by Melih Gökmen on 28.06.2022.
//

import RxSwift
import UIKit

class AppCoordinator: ReactiveCoordinator<Void> {
    var window : UIWindow
    
    init(window : UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Void> {
        let splashViewController = SplashVC()
        let navigationController = UINavigationController(rootViewController: splashViewController)
        navigationController.setNavigationBarHidden(true, animated: true)
        let splashCoordinator = SplashCoordinator(rootViewController: splashViewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        return coordinate(to: splashCoordinator)
    }
}
