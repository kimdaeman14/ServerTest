//
//  LoginTextField.swift
//  Class0725
//
//  Created by kimdaeman14 on 2018. 7. 25..
//  Copyright © 2018년 GoldenShoe. All rights reserved.
//

import UIKit

@IBDesignable
final class LoginTextField: UITextField{
    
    //텍스트필드 왼쪽에 이미지 적용하고, 색도 넣기
    @IBInspectable
    var leftImage: UIImage?{ //이거 옵셔널로 안해주면 밑에 에러나
        get{return (leftView as? UIImageView)?.image} //UITextField class에 있는 프로퍼티 leftView(uiview).
        set{let image = newValue?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
            //이거 alwaysTemplate안하면 틴트색이 안먹어.
            let leftImageView = UIImageView(image: image)
            leftImageView.tintColor = UIColor.blue //들어오는 이미지 틴트 컬러
            leftView = leftImageView
            leftViewMode = .always //항상 leftViewMode가 보이도록(여러가지가 있다. enum으로. 글쓰는동안만, 뭐그런식)
        }
    }
    
    
    //텍스트필드 아래에 라인 적용하고, 색도 넣기
    var underlineLayer: CALayer? //일단 라인만들기
    @IBInspectable
    var underlingColor:UIColor{
        //if 컬러가 없으면 밝은회색으로 리턴해라.
        get{return UIColor(cgColor: underlineLayer?.borderColor ?? UIColor.lightGray.cgColor)}
        set{
            let underlineLayer = CALayer()
            underlineLayer.borderWidth = 1
            underlineLayer.borderColor = newValue.cgColor //layer.backgroundColor = newValue.cgColor 이것도 가능
            underlineLayer.frame = CGRect(x: 0, y: frame.height + 20, width: frame.width, height: 1)
            self.underlineLayer = underlineLayer
            layer.addSublayer(underlineLayer)//뷰올리듯이 레이어 올리는 것.
        }
    
    }

    
    
    
    
}
