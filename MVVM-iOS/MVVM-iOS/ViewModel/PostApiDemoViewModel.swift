//
// Created by Appentus Technologies on 25/02/22.
// Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
// 

import Foundation

struct PostApiDemoViewModel {
    func createEmployee(with request: CreateUserRequest, completion: @escaping (_ success: Bool, _ error: String?) -> Void) {
        
        //check validation
        let validator = CreateUserValidation()
        let validationResult = validator.validate(request: request)
        
        if validationResult.success {
            // send request
            let userResource = CreateUserResource()
            userResource.createNewUser(userRequest: request) { response, error in
                if let error = error {
                    completion(false, error)
                } else {
                    // analyse response
                    guard let response = response else {
                        completion(false, "❌ No response from server")
                        return
                    }
                    if response.status == "success" {
                        completion(true, response.status)
                    } else {
                        completion(false, response.status)
                    }
                }
            }
        } else {
            completion(false, validationResult.errorMessage)
        }
    }
}
