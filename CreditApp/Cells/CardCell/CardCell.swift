//
//  CardCell.swift
//  CreditApp
//
//  Created by Gumru on 5/28/24.
//

import UIKit

protocol CardProtocol{
    var amount: String {get}
    var rate: String {get}
    var history: String {get}
    var cardId: Int {get}
}

class CardCell: UICollectionViewCell {
    
    @IBOutlet weak var amountA: UILabel!
    @IBOutlet weak var rateR: UILabel!
    @IBOutlet weak var historyH: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(model: CardProtocol){
        amountA.text = model.amount
        rateR.text = model.rate
        historyH.text = model.history
    }

}
