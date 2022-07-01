//
//  API.swift
//  EnquraCase
//
//  Created by Melih Gökmen on 28.06.2022.
//

import Foundation
import Moya
import UIKit
import RxSwift
import Alamofire

class EnquraService: ServiceDelegate {

    internal let networkManager: NetworkManagerDelegate

    init(networkManager: NetworkManagerDelegate = NetworkManager()) {
        self.networkManager = networkManager
    }

    func hr24(request: EnquraRequest = .init()) -> Single<[BankListResponse]> {
        networkManager.sendRequest(request: request)
    }
}

class EnquraRequest: Request {

    override var path: String {
        "/bankdata"
    }
}

protocol RequestDelegate {
    var base: String { get }
    var path: String { get }
    var endpoint: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters { get }
    var headers: HTTPHeaders { get }
    var testResponseFile: String { get set }
}

class Request: RequestDelegate {

    var base: String = "https://raw.githubusercontent.com/fatiha380/mockjson/main"
    var path: String { "" }
    var endpoint: String {
        base + path
    }
    var method: HTTPMethod { .get }
    var parameters: Parameters { [:] }
    var headers: HTTPHeaders { [:] }
    var testResponseFile: String = ""
}



/*
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
*/
