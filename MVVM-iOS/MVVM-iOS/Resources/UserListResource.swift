//
//  UserListResource.swift
//  MVC-iOS
//
//  Created by love on 27/06/21.
//

import Foundation

struct UserListResource {
    
    func getUserList(completionHandler: @escaping (_ result: UserListResponse?, _ error: String?) -> Void) {
        
        guard let requestUrl = URL(string: Endpoint.userList.path()) else {
            completionHandler(nil, "❌ Error:- Incorrect request url path! Unable to convert request path to URL")
            return
        }
        
        let huRequest = HURequest.init(withUrl: requestUrl,
                                       forHttpMethod: .get,
                                       requestBody: nil)
        
        HttpUtility.shared.request(huRequest: huRequest, resultType: UserListResponse.self) { result in
            switch result {
            case .success(let result):
                completionHandler(result, nil)
            case .failure(let error):
                completionHandler(nil, error.reason)
            }
        }
    }
}
