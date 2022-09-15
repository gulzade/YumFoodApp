//
//  CartTableViewCell.swift
//  YumFoodsApp
//

import UIKit
import Kingfisher

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var doodCartImageView: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodPieceAndCostLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    func showImages(imageName: String) {
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(imageName)") {
            DispatchQueue.main.async {
                self.doodCartImageView.kf.setImage(with: url)
            }
        }
    }
}
