//
//  FoodDetailRouter.swift
//  YumFoodsApp
//
//  Created by Gülzade Karataş on 15.09.2022.
//

import Foundation

class FoodDetailRouter :PresenterToRouterFoodDetailProtocol{
    static func createModule(ref: DetailViewController) {
        
        ref.foodDetailPresenterObject = FoodDetailPresenter()
        ref.foodDetailPresenterObject?.foodDetailInteractor = FoodDetailInteractor()
        
    }
    
    
}
