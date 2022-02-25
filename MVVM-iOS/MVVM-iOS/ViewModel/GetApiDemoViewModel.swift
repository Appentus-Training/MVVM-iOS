//
// Created by Appentus Technologies on 25/02/22.
// Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
// 

import Foundation

struct GetApiDemoViewModel {
    func fetchUsers(completion: @escaping (_ users: [UserDetail]?, _ error: String?) -> Void) {
        let resource = UserListResource()
        resource.getUserList { result, error in
            if let error = error {
                completion(nil, error)
            } else {
                guard let result = result else {
                    completion(nil, "❌ error fetching users")
                    return
                }

                if result.status == "success" {
                    completion(result.data, nil)
                } else {
                    completion(nil, result.message)
                }
            }
        }
    }
}
