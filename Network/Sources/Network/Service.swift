//
//  Service.swift
//  
//
//  Created by Thonatas Borges on 5/6/22.
//

import Foundation
import Moya

public protocol ServiceProtocol {
    func getText(completion: @escaping(Swift.Result<Model, Error>) -> Void)
}

public class Service: ServiceProtocol {
//    fileprivate var provider: MoyaProvider<Target>?
//
//    public init(isStub: Bool = false, mock: Mockable? = nil) {
//        self.provider = ProviderFactory.getProvider(AccountAPI.self, isStub: isStub, mock: mock)
//    }
    
    public func getText(completion: @escaping(Swift.Result<Model, Error>) -> Void) {
        provider?.request(.getAccount(request: account)) { (result) in
            switch result {
            case .success(let moyaResponse):
                do {
                    let moyaResponse = try JSONDecoder().decode(Model.self, from: moyaResponse.data)
                    completion(.success(moyaResponse))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func getProvider<T>(_ targetType: T.Type, mock: Mockable? = nil) -> ((T) -> Endpoint)  {
        let endpointClosure = { (target: T) -> Moya.Endpoint in
            let url = URL(target: T).absoluteString
            return Moya.Endpoint(url: url,
                                 sampleResponseClosure: {.networkResponse(mock?.statusCode ?? 200,
                                                                          mock?.data ?? target.sampleData)},
                                 method: target.method,
                                 task: target.task,
                                 httpHeaderFields: target.headers)
        }
        return endpointClosure
    }
}
