//
//  LoginButton.swift
//  Class0725
//
//  Created by kimdaeman14 on 2018. 7. 25..
//  Copyright © 2018년 GoldenShoe. All rights reserved.
//

import UIKit

/*
 IBDesignable, IBInspectable
 이 기능들은 커스텀 뷰를 만들때 인터페이스 빌더 내에서 라이브로 화면이 어떻게 구성되는지 보여줄 수 있습니다.
 Xcode6부터 추가되었고, 이는 커스텀 뷰를 만들기 위해 수 많은 빌드를 통해 실행하여 볼 필요가 없음을 의미합니다.
 */



@IBDesignable
final class LoginButton: UIButton {

    
    @IBInspectable
    var cornerRadius: CGFloat{
        get{return layer.cornerRadius }
        set{ layer.cornerRadius = newValue} // newValue라는건 set에 있는거같은데?
    }
    
    @IBInspectable
    var borderWidth: CGFloat{
        get{return layer.borderWidth}
        set{ layer.borderWidth = newValue}
    }
    
    @IBInspectable
    var borderColor: UIColor{ //이부분은 잘모르겠군. 다음에 다시 보도록해.
        get{return UIColor(cgColor: layer.borderColor ?? UIColor.blue.cgColor)}//만약 컬러가 없으면 파란색으로해.

        set{ layer.borderColor = newValue.cgColor}
    }


}




