//
//  CartRouter.swift
//  YumFoodsApp
//
//  Created by Gülzade Karataş on 15.09.2022.
//

import Foundation

class CartRouter : PresenterToRouterCartProtocol{
    static func createModule(ref: CartViewController) {
        
        let presenter:ViewToPresenterCartProtocol & InteractorToPresenterCartProtocol = CartPresenter()
        
        ref.cartPresenterObject = presenter
        
        ref.cartPresenterObject?.cartInteractor = SepetInteractor()
        ref.cartPresenterObject?.cartView = ref
        
        ref.cartPresenterObject?.cartInteractor?.cartPresenter = presenter
        
    }
}
