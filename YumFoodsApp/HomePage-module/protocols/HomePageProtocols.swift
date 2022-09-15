//
//  HomePageProtocols.swift
//  YumFoodsApp
//
//  Created by Gülzade Karataş on 15.09.2022.
//

import Foundation


protocol ViewToPresenterHomepageProtocol {
    
    var homepageView:PresenterToViewHomepageProtocol?{get set}
    var homepageInteractor:PresenterToInteractorHomepageProtocol?{get set}
    
    func getTheFoods()
}

protocol PresenterToInteractorHomepageProtocol {
    var homepagePresenter:InteractorToPresenterHomepageProtocol?{get set}
    
    func getAllFoods()
    
}

protocol InteractorToPresenterHomepageProtocol {
    func sendDataToPresenter(foodslist:Array<Foods>)
}

protocol PresenterToViewHomepageProtocol {
    func sendDataToView(foodsList:Array<Foods>)
}


protocol PresenterToRouterHomepageProtocol {
    static func createModule(ref:HompageViewController)
}
