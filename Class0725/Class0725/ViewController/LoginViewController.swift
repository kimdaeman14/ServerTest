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
    var postlist: [PostList] = []

    @IBOutlet weak var emailTextField:UITextField!
    @IBOutlet weak var pwTextField:UITextField!
    
    
    @IBAction private func singUpButton(_ sender: UIButton){
        print("singUpButton")
        
        let url = URL(string: "https://api.lhy.kr/members/auth-token/")
        let params = ["username": "\(emailTextField.text ?? "")", "password":"\(pwTextField.text ?? "")"]
        print(params)
        Alamofire.request(url!, method: HTTPMethod.post, parameters: params).validate(statusCode:
        200..<400).responseData { [weak self](response) in
            switch response.result{
            case .success(let value):
                print(value)
                
    // TODO: - 로그인 성공에 따른 데이터값 뭐나오는지 출력하고,
    //실패했을시 그에 해당하는 처리를 해줘야하니 에러별로 출력할것.
            
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let navigationViewController = storyboard.instantiateViewController(withIdentifier: "NavigationViewController")
                navigationViewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                self?.present(navigationViewController, animated: true)

            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }

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
