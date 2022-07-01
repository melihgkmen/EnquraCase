//
//  NetworkManager.swift
//  EnquraCase
//
//  Created by Melih Gökmen on 28.06.2022.
//

import Foundation
import Moya
import RxSwift
import RxMoya
import UIKit
import Alamofire

protocol NetworkManagerDelegate {
    func sendRequest<T: Codable>(request: Request) -> Single<T>
}

class NetworkManager: NetworkManagerDelegate {
    
    func sendRequest<T: Codable>(request: Request) -> Single<T> {
        Single<T>.create { single in
            AF.request(request.endpoint,
                       method: request.method,
                       parameters: request.parameters,
                       headers: request.headers)
                .responseData { data in
                    guard let data = data.data else {
                        //single(.error(NetworkError.init(message: .invalidResponse)))
                        return
                    }
                    
                    do {
                        let response = try JSONDecoder().decode(T.self, from: data)
                        single(.success(response))
                    } catch {
                        //single(.error(NetworkError.init(message: .responseCouldNotParse)))
                    }
                }
            
            return Disposables.create()
        }
    }
}

/*
struct RedirectData {
    var dataType: String
    var dataId: String
}

struct NetworkManager {
    
    private let provider = MoyaProvider<EnquraService> ()
    static let shared = NetworkManager()
    
    
    init() {
        
    }
    
    func getBankList() -> Observable<BankListResponse>{
        request(.getBankList)
    }
    
    
    
    func request<T: Codable>(_ request: EnquraService) -> Observable<T> {
        self.provider.rx
            .request(request)
            .asObservable()
            .filterSuccessfulStatusAndRedirectCodes().map{ (result) in
                return try result.map ( T.self )
            }
            .catch { error in
                return Observable.error(error)
            }
    }
    
    func request(_ request: EnquraService, completionHandler: @escaping (Data) -> Void)  {
        self.provider.request(request) { result in
            do {
                let response = try result.get()
                completionHandler(response.data)
                
            } catch {
                let printableError = error as CustomStringConvertible
            }
        }
    }
}
*/
