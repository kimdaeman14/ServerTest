//
//  SignUpViewController.swift
//  Class0725
//
//  Created by kimdaeman14 on 2018. 7. 25..
//  Copyright © 2018년 GoldenShoe. All rights reserved.
//

import UIKit
import Alamofire






class SignUpViewController: UIViewController {

    var postlist: [PostList] = []

    
    @IBOutlet weak var emailTextField:UITextField!
    @IBOutlet weak var pwTextField:UITextField!
    
    
    func signUp(){
        let url = URL(string: "https://api.lhy.kr/members/signup/")
        let param : Parameters =
            ["username": "\(emailTextField.text ?? "")", "password":"\(pwTextField.text ?? "")"]
        
        Alamofire.request(url!, method: HTTPMethod.post, parameters: param)
        .validate(statusCode: 200..<400)
            .responseData { [weak self] (response) in
                switch response.result{
                case .success(let value):
                    print(value)
                    do{
                        self?.postlist = try JSONDecoder().decode([PostList].self, from: value)
                    }catch{
                        print(error.localizedDescription)
                    }
                    
                    print(self?.postlist)
                case .failure(let error):
                    print(error)
                }
        }
    }

    @IBAction private func pushSignUpButton(_ sender: UIButton){
        signUp()
    }

    
    
    @IBAction private func returnMainViewController(_ sender: UIButton){
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

 
}


