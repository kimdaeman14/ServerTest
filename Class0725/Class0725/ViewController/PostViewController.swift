//
//  PostViewController.swift
//  Class0725
//
//  Created by kimdaeman14 on 2018. 7. 25..
//  Copyright © 2018년 GoldenShoe. All rights reserved.
//

import UIKit
import Alamofire

class PostViewController: UIViewController {

    @IBOutlet weak var titleTextField:UITextField!
    @IBOutlet weak var contentsTextField:UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction private func createPostingButton(_ sender: UIButton) {
        let url = URL(string: "https://api.lhy.kr/posts/")
        let params = ["title" :  "\(titleTextField.text ?? "")", "content":  "\(contentsTextField.text ?? "")"]
        let header = ["Authorization": "Token a88ea26174fa4886c5afd2e1c08a2bb443d766ba"]
        
        
        // FIXME: - token 헤더로 넘기는 방법말고, 회원가입 또는 로그인하면서 하는방법으로 변경하기.
        // 포스팅하는법 제대로 다시 이해하기
        // 그리고 사진 재사용되면서 에러발생?하는거? 그거도 해결하기.

        guard let image = UIImage(named: "home") else { return }
        guard let imageData = UIImagePNGRepresentation(image) else { return }
    
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for (key, value) in params {
                multipartFormData.append(value.data(using: .utf8)!, withName: key)
            }
            multipartFormData.append(imageData,
                                     withName: "img_cover",
                                     fileName: "tested.png",
                                     mimeType: "image/png")
            
        }, to: url!, method: HTTPMethod.post, headers: header)
        { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    print("-------------response--------------")
                    debugPrint(response)
                }
            case .failure(let encodingError):
                print("---------error---------")
                print(encodingError)
            }
        }

    }}
