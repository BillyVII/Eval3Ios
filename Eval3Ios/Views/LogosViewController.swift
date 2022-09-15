//
//  LogosViewController.swift
//  Eval3Ios
//
//  Created by Student09 on 15/09/2022.
//

import UIKit
import Network
import Alamofire

class LogosViewController: UIViewController {
    @IBOutlet weak var logosTableView: UITableView!
    var logos = [CryptoDetails]()
    let monitor = NWPathMonitor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logosTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func ConnectionAndRequest () {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                AF.request("https://api.coinstats.app/public/v1/coins?skip=0&limit=50&currency=EUR").response { dataResponse in
                    switch dataResponse.result {
                    case .success(let data):
                        let decoder = JSONDecoder()
                        do {
                            let decodage = try decoder.decode(CryptoData.self, from: data!)
                            self.logos = decodage.data
                            self.logosTableView.reloadData()
                        } catch {
                            print("C'est la fin pour toi Gralord")
                        }
                    case .failure(let error):
                        print("ERROR DETECTED \(error)")
                    }
                    
                }
                
            } else {
                
            }
        }
    }

}
extension LogosViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        logos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        return cell
    }
    
    
}
