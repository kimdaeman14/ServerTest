//
//  ListViewController.swift
//  Class0725
//
//  Created by kimdaeman14 on 2018. 7. 25..
//  Copyright © 2018년 GoldenShoe. All rights reserved.
//

import UIKit
import Alamofire

struct PostList: Codable {
    let title: String
    let imageCover: String? //아..이게 null인 경우도 있어서 이거 ? 안해주면 타입이 안맞아서 안뜨나보다.
    let createdDate : String
//    let author: [Author]

    
    enum CodingKeys: String, CodingKey{
        case title
        case imageCover = "img_cover"
        case createdDate = "created_date"
    }
    
//    struct Author: Codable {
//        let name: String
//    }
    
    
}



class ListViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!

    var postlist: [PostList] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }


    @IBAction private func logoutButton(_ sender: UIButton){
        let alertController = UIAlertController(title: "Logout", message:
            "로그아웃 되었습니다.", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: { [weak self](ok) in
            let storybord = UIStoryboard(name: "Login", bundle: nil)
            let mainViewController = storybord.instantiateViewController(withIdentifier: "MainViewController")
            mainViewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self?.present(mainViewController, animated: true)
        }))
        present(alertController, animated: true, completion: nil)
    }
    
    
    func dataDecode(){
        let url = URL(string: "https://api.lhy.kr/posts/")

        Alamofire.request(url!, method: HTTPMethod.get)
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataDecode()
    }


    
}


extension ListViewController: UITableViewDataSource{
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        print("\n---------- [ numberOfRowsInSection ] ----------\n")

        return postlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("\n---------- [ tabelviewtabelviewtabelviewtabelviewtabelview ] ----------\n")
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                        print(self.postlist)

        cell.textLabel?.text = self.postlist[indexPath.row].title
        cell.detailTextLabel?.text = self.postlist[indexPath.row].createdDate
        let imageCoverURL = self.postlist[indexPath.row].imageCover
        
        //URL(string: imageCoverURL)에 값이있는지확인하고 없으면 nil있으면 url에 넣고, 아래 스코프를 실행해라는 명령.
        //아래 스코프를 빈채로두거나 하면 에러남.
    
        //아 행복하다...ㅠㅠ 이래서 옵셔널 바인딩을 배우라는거구나.
        if let imageCoverURL = imageCoverURL {
                    let url = URL(string: imageCoverURL)
            if let urlData = url {
                        let data = try? Data(contentsOf: urlData)
                if let image = data{
                            let images = UIImage(data: image)
                            cell.imageView?.image = images
                }
            }
        }
        return cell
    }
    
    
}
