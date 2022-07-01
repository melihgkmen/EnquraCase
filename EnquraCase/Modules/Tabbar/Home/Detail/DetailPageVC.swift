//
//  DetailPageVC.swift
//  EnquraCase
//
//  Created by Melih Gökmen on 28.06.2022.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import Firebase
import FirebaseAnalytics

class DetailPageVC : UIViewController {
    
    @IBOutlet weak var labelBankaSube: UILabel!
    @IBOutlet weak var labelSehir: UILabel!
    @IBOutlet weak var labelBankaTipi: UILabel!
    @IBOutlet weak var labelBankKodu: UILabel!
    @IBOutlet weak var labelAdres: UILabel!
    @IBOutlet weak var labelBolge: UILabel!
    @IBOutlet weak var labelATM: UILabel!
    @IBOutlet weak var mapBtn: UIButton!
       
       var viewModel: DetailPageVM

        let disposeBag: DisposeBag = .init()

       init(viewModel: DetailPageVM) {
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override func viewDidLoad() {
            super.viewDidLoad()
            Analytics.logEvent("detail_screen_opened", parameters: nil )
            viewModel.bank.subscribe(onNext: { bank in
                Analytics.logEvent("share_bank", parameters: [
                    "bank_sube": bank.dcBANKASUBE as NSObject,
                    "bank_sehir": bank.dcSEHIR as! NSObject,
                    "bank_tipi": bank.dcBANKATIPI as NSObject,
                    "bank_kodu": bank.dcBANKKODU as NSObject,
                    "bank_adres": bank.dcADRES as NSObject,
                    "bank_bolge": bank.dcBOLGEKOORDINATORLUGU as NSObject,
                    "bank_atm": bank.dcENYAKIMATM as NSObject
                ])
                self.labelBankaSube.text =  "Banka Şubesi:\(String(describing: bank.dcBANKASUBE))"
                self.labelSehir.text =  "Şehir:\(String(describing: bank.dcSEHIR))"
                self.labelBankaTipi.text = "Banka Tipi:\(bank.dcBANKATIPI )"
                self.labelBankKodu .text = "Banka Kodu:\(bank.dcBANKKODU )"
                self.labelAdres .text = "Banka Adresi:\(bank.dcADRES )"
                self.labelBolge .text =  "Bölge:\(bank.dcBOLGEKOORDINATORLUGU )"
                self.labelATM .text =  "En Yakın ATM:\(bank.dcENYAKIMATM )"
            })
            .disposed(by: disposeBag)
            
        }

  
}


