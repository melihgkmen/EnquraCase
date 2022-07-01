//
//  TabBarCoordinator.swift
//  EnquraCase
//
//  Created by Melih Gökmen on 28.06.2022.
//

import Foundation
import UIKit
import RxSwift

class TabBarCoordinator: ReactiveCoordinator<Void> {
    
    private let rootViewController: UIViewController
    private var navigationControllers: [UINavigationController]
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
        self.navigationControllers = TabBar.items
            .map({ (item) -> UINavigationController in
                return item.navigationController
            })
    }
    
    override func start() -> Observable<Void> {
        let vc = TabBarVC()
        vc.tabBar.isTranslucent = false
        
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor =  UIColor.systemGray5
            vc.tabBar.standardAppearance = appearance;
            vc.tabBar.scrollEdgeAppearance = vc.tabBar.standardAppearance
        } else {
            
        }
       
        vc.viewControllers = navigationControllers
        
        let coordinates = navigationControllers.enumerated()
            .map { (offset, element) -> Observable<Void> in
                guard let items = TabBar(rawValue: offset) else { return Observable.just(() )}
                switch items {
                case .homePage:
                    return coordinate(to: HomePageCoordinator(rootViewController: self.rootViewController, navigationController: element))
                case .profile:
                    return coordinate(to: ProfileCoordinator(rootViewController: self.rootViewController, navigationController: element))
               
                }
        }
        
        Observable.merge(coordinates)
            .subscribe()
            .disposed(by: disposeBag)
        
        rootViewController.navigationController!.setNavigationBarHidden(true, animated: true)
        rootViewController.navigationController?.pushViewController(vc, animated: true)
        
        return  Observable.never()
    }
}
