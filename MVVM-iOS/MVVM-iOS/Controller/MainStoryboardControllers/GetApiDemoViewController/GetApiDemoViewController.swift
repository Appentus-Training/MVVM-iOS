//
//  GetApiDemoViewController.swift
//  MVC-iOS
//
//  Created by love on 27/06/21.
//

import UIKit

class GetApiDemoViewController: UIViewController {
    
    @IBOutlet weak var EmployeeListTableView: UITableView!
    
    var userListArr: [UserDetail] = []
    
    let getApiViewModel = GetApiDemoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.initViews()
    }
    
    func initViews() {
        fetchUserList()
    }
    
}

// MARK: Tableview Delegates And Datasource

extension GetApiDemoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userListArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailTableViewCell") as? UserDetailTableViewCell {
            cell.selectionStyle = .none
            cell.initCell(with: userListArr[indexPath.item])
            return cell
        }
        return UITableViewCell.init()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: API- Fetch Users list

extension GetApiDemoViewController {
    
    func fetchUserList() {
        Loader.shared.show()
        getApiViewModel.fetchUsers { users, error in
            Loader.shared.hide()
            if let error = error {
                debugPrint(error)
                self.showAlert(with: error)
            } else {
                self.userListArr = users ?? []
                self.EmployeeListTableView.reloadData()
            }
        }
    }
}
