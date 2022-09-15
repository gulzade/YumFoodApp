//
//  FoodDetailPresenter.swift
//  YumFoodsApp
//
//  Created by Gülzade Karataş on 15.09.2022.
//

import Foundation

class FoodDetailPresenter :ViewToPresenterFoodDetailProtocol {
    var foodDetailInteractor: PresenterToInteractorFoodDetailProtocol?
    
    func add(yemekAdi: String, yemekResimAdi: String, yemekFiyat: Int, yemekSiparisAdet: Int, kullaniciAdi: String) {
        foodDetailInteractor?.addFood(yemekAdi: yemekAdi, yemekResimAdi: yemekResimAdi, yemekFiyat: yemekFiyat, yemekSiparisAdet: yemekSiparisAdet, kullaniciAdi: kullaniciAdi)
    }

}
