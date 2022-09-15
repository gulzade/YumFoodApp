//
//  DetailViewController.swift
//  YumFoodsApp
//
//  Created by Gülzade Karataş on 15.09.2022.
//

import UIKit
import Kingfisher
import Alamofire

class DetailViewController: UIViewController {
    
    @IBOutlet weak var productImaceView: UIImageView!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productCost: UILabel!
    @IBOutlet weak var productCount: UILabel!
    
    
    var getFood:Foods?
    var foodDetailPresenterObject:ViewToPresenterFoodDetailProtocol?
    var pCount:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FoodDetailRouter.createModule(ref: self)
        if let food = getFood {
            showImages(imageName: food.yemek_resim_adi!)
            productName.text = food.yemek_adi!
            productCost.text =  "₺\(food.yemek_fiyat!)"
            productDescription.text = "Lorem ipsum dolor sit amet, consectetur adipis a elementum sit eu quam vulputate ultricies a."
        }
    }
    
    
    func showImages(imageName: String) {
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(imageName)") {
            DispatchQueue.main.async {
                self.productImaceView.kf.setImage(with: url)
            }
        }
    }
    
    
    @IBAction func increaseCount(_ sender: Any) {
        productCount.text = "\(pCount)"
        if let food = getFood {
            if pCount >= 1 {
                pCount += 1
                productCount.text = "\(pCount)"
                
                let price =  (Int(food.yemek_fiyat!)!) * pCount
                productCost.text = "₺\(price)"               
            }
            else if pCount == 0 {
                let price =  (Int(getFood!.yemek_fiyat!)!)
            }
        }
        
    }
    
    @IBAction func decreaseCount(_ sender: Any) {
        productCount.text = "\(pCount)"
        if pCount > 1 {
            pCount -= 1
            if let food = getFood {
                
                productCount.text = "\(pCount)"
                let price =  (Int(food.yemek_fiyat!)!) * pCount
                productCost.text = "₺\(price)"
            }
        } else if pCount == 0 {
            let price =  (Int(getFood!.yemek_fiyat!)!)
        }
    }
    
    @IBAction func addToCartButton(_ sender: Any) {
        if let food = getFood {
            foodDetailPresenterObject?.add(yemekAdi: food.yemek_adi!, yemekResimAdi: food.yemek_resim_adi!, yemekFiyat: Int(food.yemek_fiyat!)!, yemekSiparisAdet: pCount, kullaniciAdi: "gulzade")
            let alert = UIAlertController(title: "Successful", message: "The product has been successfully added to the cart.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { (action: UIAlertAction!) in
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true)
        }else{
            let alert = UIAlertController(title: "Error", message: "Adding product failed!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }
}
