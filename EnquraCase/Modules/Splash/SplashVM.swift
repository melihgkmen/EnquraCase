//
//  SplashVM.swift
//  EnquraCase
//
//  Created by Melih Gökmen on 28.06.2022.
//

import Foundation
import RxSwift

class SplashVM: BaseVM {
    let splashEnd = PublishSubject<Void>()
    let isSuccessSignIn = PublishSubject<Bool>()
    let defaults = UserDefaults.standard
    
}
