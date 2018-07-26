//
//  LoginViewController.swift
//  Class0725
//
//  Created by kimdaeman14 on 2018. 7. 25..
//  Copyright © 2018년 GoldenShoe. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField:UITextField!
    @IBOutlet weak var pwTextField:UITextField!
    
    
    @IBAction private func singUpButton(_ sender: UIButton){
        print("singUpButton")
        
        let url = URL(string: "https://api.lhy.kr/members/auth-token/")
        let header = ["username": "\(emailTextField.text ?? "")", "password":"\(pwTextField.text ?? "")"]

//        Alamofire.request(url!, method: HTTPMethod.post, headers: header).validate(statusCode: 200..<400).responseData { (response) in
//            switch response.result{
//            case .success(let value):
//                print(value)

                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let navigationViewController = storyboard.instantiateViewController(withIdentifier: "NavigationViewController")
                navigationViewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                self.present(navigationViewController, animated: true)

//            case .failure(let error):
//                print(error)
//            }
//        }

    }
    
    @IBAction private func returnMainViewController(_ sender: UIButton){
        dismiss(animated: true, completion: nil)
       
    }

    deinit{
        print("deinit LoginViewController")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //키보드는 기본적으로 텍스트필드를 찍으면 올라오긴 하는데,
        //얘는 뷰시작되자마자 첫응답(텍스트필드를찍을때)가 아니라 그냥 시작되자마자 올라오는 것.
        emailTextField.becomeFirstResponder()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)//뷰가사라질때 키보드 내려가도록
    }


}
