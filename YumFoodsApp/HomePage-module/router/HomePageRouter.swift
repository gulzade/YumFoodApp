//
//  HomePageRouter.swift
//  YumFoodsApp
//
//  Created by Gülzade Karataş on 15.09.2022.
//

import Foundation

class HomePageRouter:PresenterToRouterHomepageProtocol{
    static func createModule(ref: HompageViewController) {
        let presenter:ViewToPresenterHomepageProtocol & InteractorToPresenterHomepageProtocol = HomePagePresenter()
        
        //ViewController
        ref.homepagePresenterObject = presenter
        
        //presenter
        ref.homepagePresenterObject?.homepageInteractor = HomePageInteractor()
        ref.homepagePresenterObject?.homepageView = ref
        
        //Interactor
        ref.homepagePresenterObject?.homepageInteractor?.homepagePresenter = presenter
    }
    
    
}

