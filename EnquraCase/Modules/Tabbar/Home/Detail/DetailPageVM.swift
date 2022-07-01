//
//  DetailPageVM.swift
//  EnquraCase
//
//  Created by Melih Gökmen on 28.06.2022.
//

import Foundation
import RxSwift
import RxCocoa

class DetailPageVM : BaseVM{
    
    let bank: BehaviorRelay<BankListResponse>

    init(bank: BankListResponse) {
        self.bank = .init(value: bank)
    }
}
