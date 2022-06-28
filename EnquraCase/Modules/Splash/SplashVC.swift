//
//  SplashVC.swift
//  EnquraCase
//
//  Created by Melih Gökmen on 28.06.2022.
//

import Foundation
import UIKit
import RxSwift

class SplashVC: BaseVC<SplashVM>{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        Thread.sleep(forTimeInterval: 3)
        self.viewModel?.splashEnd.onNext(())
    }
    
    
}
