//
//  ViewController.swift
//  Eval3Ios
//
//  Created by Student09 on 14/09/2022.
//

import UIKit
import Alamofire
import AlamofireImage
import Network

class ViewController: UIViewController {

    @IBOutlet weak var kryptoTableView: UITableView!
    var cryptoList = [CryptoLive]()
    private let monitor = NWPathMonitor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        kryptoTableView.dataSource = self
        kryptoTableView.delegate = self
        kryptoTableView.register(UINib(nibName: "CoinTableViewCell", bundle: .main), forCellReuseIdentifier: "CoinTableViewCell")
            
        
        ConnectionAndRequest()
    }
  

    func ConnectionAndRequest () {
        monitor.pathUpdateHandler = { path in
            
        if path.status == .satisfied {
            
            AF.request("https://api.coincap.io/v2/assets").response { dataResponse in
                
                switch dataResponse.result {
                    
                case .success(let data):
                    let decoder = JSONDecoder()
                    do {
                        let decodage = try decoder.decode(CryptoData.self, from: data!)
                        self.cryptoList = decodage.data
                        self.kryptoTableView.reloadData()
                    } catch {
                        print("Hulk dans ta face, AIE",error)
                    }
                    
                    
                case .failure(let error):
                    print("ERROR DETECTED \(error)")
                }
            }
        } else {
            print("no connection")
        }
    }
        monitor.start(queue: .global())
}
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cryptoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = kryptoTableView.dequeueReusableCell(withIdentifier: "CoinTableViewCell", for: indexPath) as! CoinTableViewCell
        
        cell.setupCell(crypto: cryptoList[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coin = cryptoList[indexPath.row]
        // afficher les infos sur une autre vue
        if let detailsViewController =
            storyboard?.instantiateViewController(identifier: "detailsViewController"){
            navigationController?.pushViewController(detailsViewController, animated: true)

        }
    }
}
