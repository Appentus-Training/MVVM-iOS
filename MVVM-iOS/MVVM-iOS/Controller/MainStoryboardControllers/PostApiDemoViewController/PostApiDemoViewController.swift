//
//  PostApiDemoViewController.swift
//  MVC-iOS
//
//  Created by love on 27/06/21.
//

import UIKit

class PostApiDemoViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var salaryTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
   
    let postApiDemoViewModel = PostApiDemoViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func resetInputFields() {
        nameTF.text = ""
        salaryTF.text = ""
        ageTF.text = ""
    }
    
    @IBAction func createUserBtn(_ sender: UIButton) {
        createNewEmployee()
    }
}

// MARK: API- create new employee

extension PostApiDemoViewController {
    
    func createNewEmployee() {
        Loader.shared.show()
        let userRequest = CreateUserRequest.init(name: self.nameTF.text ?? "", salary: self.salaryTF.text ?? "", age: self.ageTF.text ?? "")

        postApiDemoViewModel.createEmployee(with: userRequest) { success, error in
            Loader.shared.hide()
            if success {
                self.resetInputFields()
                self.showAlert(with: error ?? "")
            } else {
                self.showAlert(with: error ?? "")
            }
        }
    }
}

