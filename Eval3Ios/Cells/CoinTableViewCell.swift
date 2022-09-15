//
//  CoinTableViewCell.swift
//  Eval3Ios
//
//  Created by Student09 on 14/09/2022.
//

import UIKit

class CoinTableViewCell: UITableViewCell {

    @IBOutlet weak var infoImageView: UIImageView!
    @IBOutlet weak var coinLabel: UILabel!
    @IBOutlet weak var idCoinLabel: UILabel!
    @IBOutlet weak var dollarsValueLabel: UILabel!
    @IBOutlet weak var variationValueCoinLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupCell (crypto: CryptoLive) {
        idCoinLabel.text = crypto.rank
        coinLabel.text = crypto.name
        dollarsValueLabel.text = crypto.priceUsd
        variationValueCoinLabel.text = crypto.changePercent24Hr
    }
  
}
