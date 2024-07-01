//
//  HomeViewController.swift
//  CreditApp
//
//  Created by Gumru on 5/19/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var payCreditButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        
        payCreditButton.layer.cornerRadius = 6
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func payButton(_ sender: Any){
        payButtonClicked()
    }
    
    func payButtonClicked(){
        let vc = UIStoryboard.init(name: "Home", bundle: Bundle.main).instantiateViewController(withIdentifier: "PayCreditViewController") as? PayCreditViewController ?? PayCreditViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    fileprivate func setupView() {
        collection.register(UINib(
            nibName: "CardCollectionCell",
            bundle: nil),forCellWithReuseIdentifier: "CardCollectionCell")
    }
    
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CardCollectionCell",
            for: indexPath) as! CardCollectionCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width:collectionView.frame.width, height: collectionView.frame.height)
    }
    
    
}
