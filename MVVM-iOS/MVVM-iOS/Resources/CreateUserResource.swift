//
//  CreateUserResource.swift
//  MVC-iOS
//
//  Created by love on 27/06/21.
//

import Foundation

struct CreateUserResource {
    
    func createNewUser(userRequest: CreateUserRequest, completionHandler: @escaping (_ result: CreateUserResponse?, _ error: String?) -> Void) {
        
        guard let requestUrl = URL(string: Endpoint.createUser.path()) else {
            completionHandler(nil, "❌ Error:- Incorrect request url path! Unable to convert request path to URL")
            return
        }
        let jsonEncoder = JSONEncoder()
        
        do {
            let requestBody = try jsonEncoder.encode(userRequest)
            let huRequest = HURequest.init(withUrl: requestUrl,
                                           forHttpMethod: .post,
                                           requestBody: requestBody)
            
            HttpUtility.shared.request(huRequest: huRequest, resultType: CreateUserResponse.self) { result in
                switch result {
                case .success(let result):
                    completionHandler(result, nil)
                case .failure(let error):
                    completionHandler(nil, error.reason)
                }
            }
            
        } catch {
            completionHandler(nil, "❌ Error:- Incorrect User Request unable to convert to data")
        }
    }
}
