//
//  SignUpViewController.swift
//  Class0725
//
//  Created by kimdaeman14 on 2018. 7. 25..
//  Copyright © 2018년 GoldenShoe. All rights reserved.
//

import UIKit
import Alamofire


struct User: Codable {
    let pk: Int
    let username: String
    var firstName: String?
    var lastName: String?
    var email: String?
    
//    enum CodingKeys: String, CodingKey {
//        case user
//        case token
//    }
    
    enum AdditionalInfoKeys: String, CodingKey {
        case pk
        case username
        case firstName = "first_name"
        case lastName = "last_name"
        case email
    }
}



class SignUpViewController: UIViewController {

    var user: [User] = []

    
    @IBOutlet weak var emailTextField:UITextField!
    @IBOutlet weak var pwTextField:UITextField!
    
    
    func signUp(){
        let url = URL(string: "https://api.lhy.kr/members/signup/")
        let params : Parameters =
            ["username": "\(emailTextField.text ?? "")", "password":"\(pwTextField.text ?? "")"]
        print(params)
        Alamofire.request(url!, method: HTTPMethod.post, parameters: params)
        .validate(statusCode: 200..<400)
            .responseData { [weak self] (response) in
                switch response.result{
                case .success(let value):
                    print(value)
                    self?.alert()
// FIXME: - user형식 맞춰서 가입정보들 출력할수있도록 구현할것
//                    do{
//                        self?.user = try JSONDecoder().decode([User].self, from: value)
//                    }catch{
//                        print(error.localizedDescription)
//                    }
//
//                    print(self?.user)
                    

                case .failure(let error):
                    print(error)
                }
        }
    }

    func alert(){
        let alertController = UIAlertController(title: "가입성공", message:
            "회원가입이 완료되었습니다.", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "로그인하러가기", style: UIAlertActionStyle.default, handler: { [weak self](ok) in
            self?.presentingViewController?.dismiss(animated: true)
        }))
        present(alertController, animated: true, completion: nil)
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


