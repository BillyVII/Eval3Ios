//
//  detailsViewController.swift
//  Eval3Ios
//
//  Created by Student09 on 14/09/2022.
//

import UIKit
import Network
import Alamofire
import AlamofireImage

class detailsViewController: UIViewController {
    @IBOutlet weak var detailsTableView: UITableView!
    var details = [CryptoLive]()
    private let monitor = NWPathMonitor()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsTableView.dataSource = self
        
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                AF.request("https://api.coincap.io/v2/assets/bitcoin/history?interval=d1").response { dataResponse in
                    switch dataResponse.result {
                    case .success(let data):
                        do {
                            let decoder = JSONDecoder()
                            let decodage = try decoder.decode(CryptoData.self, from: data!)
                            
                            self.details = decodage.data
                            self.detailsTableView.reloadData()
                        }
                        catch {
                            print("Achevement Thanos")
                        }
                    case .failure(let error):
                        print("ERROR DETECTED \(error)")
                    }
                }
            } else {
                print("ERROR CONNECTION")
            }
        }
        monitor.start(queue: .global())
    }
    

}
extension detailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        details.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        return cell
    }

}
