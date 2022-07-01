//
//  HomePageVM.swift
//  EnquraCase
//
//  Created by Melih Gökmen on 28.06.2022.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class HomePageVM: BaseVM {
    var goToDetail = PublishSubject<Void>()
    let banks: BehaviorRelay<[BankListResponse]> = .init(value: [])

    func refreshBanks() {
        self.showLoading.onNext(true)
        EnquraService().hr24().subscribe { response in
            self.showLoading.onNext(false)
            self.banks.accept(response)
        } onError: { error in
            self.showLoading.onNext(false)
            print(error.localizedDescription)
        }
        .disposed(by: disposeBag)
    }

    func search(_ text: String?) {
        self.showLoading.onNext(true)
        EnquraService().hr24().subscribe { response in
            guard let text = text, !text.isEmpty else {
                self.showLoading.onNext(false)
                self.banks.accept(response)
                return
            }
            self.banks.accept(response.filter { $0.dcSEHIR!.lowercased().contains(text.lowercased()) })
        } onError: { error in
            self.showLoading.onNext(false)
            print(error.localizedDescription)
        }
        .disposed(by: disposeBag)
    }
    
    /*
    func getBankList()  {
        self.showLoading.onNext(true)
        NetworkManager.shared.getBankList().subscribe(onNext: { response in
            self.showLoading.onNext(false)
            self.items.onNext(self.bankListData)
        }, onError: {error in
            print("nolduu :p")
            self.showLoading.onNext(false)
        }).disposed(by: disposeBag)
    }*/
}

