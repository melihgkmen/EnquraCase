//
//  BaseVM.swift
//  EnquraCase
//
//  Created by Melih Gökmen on 28.06.2022.
//

import Foundation
import RxSwift
import Moya

class BaseVM {
    let showLoading = BehaviorSubject<Bool>(value: false)
    var error = PublishSubject<String>()
    var moyaError: MoyaError!
    let disposeBag = DisposeBag()
}
