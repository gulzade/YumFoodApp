//
//  FoodsCollectionViewCell.swift
//  YumFoodsApp
//
//  Created by Gülzade Karataş on 15.09.2022.
//

import UIKit
import Kingfisher

class FoodsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodCost: UILabel!
    
    
    func showImages(imageName: String) {
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(imageName)") {
            DispatchQueue.main.async {
                self.foodImageView.kf.setImage(with: url)
            }
        }
    }
    
    func setupView(){
        foodImageView.layer.masksToBounds = true
        foodImageView.layer.borderColor = UIColor.systemGray4.cgColor
        foodImageView.layer.borderWidth = 1.0
        foodImageView.layer.cornerRadius = CGFloat(roundf(Float(self.foodImageView.frame.size.width / 2.0)))
        foodImageView.layer.backgroundColor = UIColor.white.cgColor
        
        
    }
}
