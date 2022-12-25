//
//  APIManager.swift
//  ActionCS
//
//  Created by Karan Sarvaiya on 22/11/22.
//

import UIKit
import ObjectMapper
import Alamofire

class APIManager : NSObject {
    
    enum RESPONSE_CODE{
        static let SessionExpire = 401
    }
    
    var method: HTTPMethod!
    var encoding: ParameterEncoding! = JSONEncoding.default
    
    var baseUrl = BASEURLS.current
    var finalUrl = ""
    
    init(service :String, method: HTTPMethod = .post, isJSONRequest: Bool = true){
        super.init()
        finalUrl = baseUrl + service
        if !isJSONRequest{
            encoding = URLEncoding.default
        }
        self.method = method
        print(baseUrl)
        print("Service: \(service)")
    }
    
    func executeRequest<T>(completion: @escaping (Result<T, Error>) -> Void) where T: Mappable {
        AF.request(finalUrl,method: method,parameters: nil,encoding: encoding, headers: nil).responseString(completionHandler: {response in
            switch response.result{
            case .success(let res):
                if let code = response.response?.statusCode{
                    switch code {
                    case 200...450:
                        if let finRespo = Mapper<T>().map(JSONString: res) {
                            print("Response : \(finRespo.toJSON())")
                            completion(.success(finRespo))
                        }else{
                            print("Check in APIManager class for error...")
                        }
                    default:
                        let error = NSError(domain: response.debugDescription, code: code, userInfo: response.response?.allHeaderFields as? [String: Any])
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
