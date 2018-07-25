//
//  MainViewController.swift
//  Class0725
//
//  Created by kimdaeman14 on 2018. 7. 25..
//  Copyright © 2018년 GoldenShoe. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBAction private func loginButton(_ sender: UIButton){
        let storyboard = UIStoryboard(name: "Login", bundle: nil) //띄워지는 스토리보드 이름을 정의해서 넣고
        //그 스토리보드에있는 뷰컨트롤러 중 어느 뷰에서 어느 뷰로 갈건지 식별자를 지정하고, 프레젠트한다.
        let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        loginViewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        present(loginViewController, animated: true)
    }
    
    @IBAction private func signUpButton(_ sender: UIButton){
        let storyboard = UIStoryboard(name: "Login", bundle: nil) //띄워지는 스토리보드 이름을 정의해서 넣고
        //그 스토리보드에있는 뷰컨트롤러 중 어느 뷰에서 어느 뷰로 갈건지 식별자를 지정하고, 프레젠트한다.
        let signUpViewController = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
        signUpViewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        present(signUpViewController, animated: true)
    }
    
    

}
