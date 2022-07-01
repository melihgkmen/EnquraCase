//
//  BankModel.swift
//  EnquraCase
//
//  Created by Melih Gökmen on 28.06.2022.
//

import Foundation

struct BankListResponse: Codable {
    let id: Int
    let dcSEHIR: String?
    let  dcILCE, dcBANKASUBE: String
    let dcBANKATIPI, dcBANKKODU, dcADRESADI: String
    let dcADRES: String
    let dcPOSTAKODU: String
    let dcONOFFLINE, dcONOFFSITE : String
    let dcBOLGEKOORDINATORLUGU, dcENYAKIMATM : String

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case dcSEHIR = "dc_SEHIR"
        case dcILCE = "dc_ILCE"
        case dcBANKASUBE = "dc_BANKA_SUBE"
        case dcBANKATIPI = "dc_BANKA_TIPI"
        case dcBANKKODU = "dc_BANK_KODU"
        case dcADRESADI = "dc_ADRES_ADI"
        case dcADRES = "dc_ADRES"
        case dcPOSTAKODU = "dc_POSTA_KODU"
        case dcONOFFLINE = "dc_ON_OFF_LINE"
        case dcONOFFSITE = "dc_ON_OFF_SITE"
        case dcBOLGEKOORDINATORLUGU = "dc_BOLGE_KOORDINATORLUGU"
        case dcENYAKIMATM = "dc_EN_YAKIM_ATM"
    }
}
