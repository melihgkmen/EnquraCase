//
//  API.swift
//  EnquraCase
//
//  Created by Melih Gökmen on 28.06.2022.
//

import Foundation
import Moya
import UIKit

enum EnquraService {
    case getBankList
   
    
}

extension EnquraService : TargetType{
    
    var baseURL: URL {
        return URL(string: "https://raw.githubusercontent.com/fatiha380/mockjson/main/")!
    }
    
    var path: String{
        switch self {
        case .getBankList:
            return "bankdata"
        
        }
    }
    var method: Moya.Method {
        switch self {
        case .getBankList:
            return .get
        }
    }
    var headers: [String : String]?{
        switch self {
        case .getBankList:
            return ["Content-Type":"application/json"]
      
        }
    }
    
    var task: Task{
        switch self {
        case .getBankList:
            return .requestPlain
       
        }
    }
    var sampleData: Data {
        return Data()
    }
}

