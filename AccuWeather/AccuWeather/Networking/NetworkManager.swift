//
//  NetworkManager.swift
//  AccuWeather
//
//  Created by Bertug YILMAZ on 9.08.2019.
//  Copyright © 2019 Furkan Beyhan. All rights reserved.
//

import Foundation
import Alamofire

final class NetworkManager {
    
    // Singleton
    static let shared: NetworkManager = NetworkManager()
    
    // MARK: Private properties
    private lazy var jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()
    
    // MARK: Constructor
    private init(){}
    
    ///
    /// TODO: Add some comment
    func request<T:Codable>(target: NetworkServices,
                            responseType: T.Type,
                            successCompletion: @escaping ((T)-> Void),
                            errorCompletion: @escaping ((NetworkError)-> Void) ){
        
        Alamofire
            .request(target.url,
                     method: target.httpMethod,
                     parameters: target.parameters,
                     headers: target.headers)
            .responseData(completionHandler: { (response) in
                response.result.ifSuccess {
                    
                    guard let data = response.data else {
                        errorCompletion(.failure("Response not parsing"))
                        return
                    }
                    
                    do {
                        let responseObject = try self.jsonDecoder.decode(responseType.self, from: data)
                        successCompletion(responseObject)
                    }catch(let error) {
                        errorCompletion(.failure(error.localizedDescription))
                    }
                }
                
                response.result.ifFailure {
                    errorCompletion(.failure("Something went wrong"))
                }
            })
    }
}
