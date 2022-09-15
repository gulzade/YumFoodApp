//
//  FoodDetailInteractor.swift
//  YumFoodsApp
//
//  Created by Gülzade Karataş on 15.09.2022.
//
import UIKit
import Foundation
import Alamofire

class FoodDetailInteractor:PresenterToInteractorFoodDetailProtocol{
    
    func addFood(yemekAdi: String, yemekResimAdi: String, yemekFiyat: Int, yemekSiparisAdet: Int, kullaniciAdi: String) {
        
        let params : Parameters = ["yemek_adi":yemekAdi,"yemek_resim_adi":yemekResimAdi,"yemek_fiyat":yemekFiyat,"yemek_siparis_adet":yemekSiparisAdet,"kullanici_adi":kullaniciAdi]
        print("inte*******")
        AF.request(
            "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php",method: .post,parameters: params).responseJSON { (response) in
                if let data = response.data{
                    do{
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
                            print(json)
                            print(data)
                            print("interactorrrr")
                            
                        }
                    }catch{
                        print(String(describing: error))
                    }
                }
            }
    }   
    
}
