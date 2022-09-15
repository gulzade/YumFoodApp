//
//  HomePageInteractor.swift
//  YumFoodsApp
//
//  Created by Gülzade Karataş on 15.09.2022.
//

import Foundation
import Alamofire

class HomePageInteractor:PresenterToInteractorHomepageProtocol {
    
    var homepagePresenter: InteractorToPresenterHomepageProtocol?
    
    func getAllFoods() {
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .get).responseJSON { response in
            
            if let data = response.data {
                do {
                    let response = try JSONDecoder().decode(FoodsResponse.self, from: data)
                    var list = [Foods]()
                    if let getList = response.yemekler {
                        list = getList
                    }
                    print(list.first?.yemek_adi)
                    self.homepagePresenter?.sendDataToPresenter(foodslist: list)
                }
                catch{
                    print(String(describing: error))
                }
            }
        }
    }
}
