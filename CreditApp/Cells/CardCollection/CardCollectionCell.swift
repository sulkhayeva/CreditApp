//
//  CardCollectionCell.swift
//  CreditApp
//
//  Created by Gumru on 5/19/24.
//

import UIKit

class CardCollectionCell: UICollectionViewCell {
    @IBOutlet weak var cardCollection: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cardCollection.register(UINib(nibName: "CardCell", bundle: nil),forCellWithReuseIdentifier: "CardCell")
    }

}

extension CardCollectionCell: UICollectionViewDelegate,
                            UICollectionViewDataSource,
                              UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CardCell",
            for: indexPath) as! CardCell
        return cell
    }
    
    
}
