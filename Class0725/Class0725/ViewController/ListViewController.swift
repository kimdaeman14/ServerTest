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
    let createdDate : String
    
    enum CodingKeys: String, CodingKey {
        case title
        case createdDate = "created_date"
    }
}



class ListViewController: UIViewController {
    
    var postlist: [PostList] = []


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
                    self?.postlist = try JSONDecoder().decode( [PostList].self, from: value)
                }catch{
                    print(error.localizedDescription)
                }
                print(self?.postlist)
//                print(self?.postlist[4].title)
//                print(self?.postlist[4].createdDate)
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
//        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("\n---------- [ tabelviewtabelviewtabelviewtabelviewtabelview ] ----------\n")
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                        print(self.postlist)

//        print(self.postlist[4].title)
//        print(self.postlist[4].createdDate)

        cell.textLabel?.text = self.postlist[indexPath.row].title
        cell.detailTextLabel?.text = self.postlist[indexPath.row].createdDate
        
        
        return cell
    }
    
    
}
