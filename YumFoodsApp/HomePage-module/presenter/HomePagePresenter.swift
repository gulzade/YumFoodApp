//
//  HomePagePresenter.swift
//  YumFoodsApp
//
//  Created by Gülzade Karataş on 15.09.2022.
//

import Foundation


class HomePagePresenter :ViewToPresenterHomepageProtocol{
    var homepageView: PresenterToViewHomepageProtocol?
    
    var homepageInteractor: PresenterToInteractorHomepageProtocol?
    
    func getTheFoods() {
        homepageInteractor?.getAllFoods()
    }
    
    
}
extension HomePagePresenter : InteractorToPresenterHomepageProtocol{
    func sendDataToPresenter(foodslist: Array<Foods>) {
        homepageView?.sendDataToView(foodsList: foodslist)
    }
    
}
