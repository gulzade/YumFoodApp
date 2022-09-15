//
//  CartFoodsResponse.swift
//  YumFoodsApp
//
//  Created by Gülzade Karataş on 15.09.2022.
//

import Foundation

class CartFoodsResponse:Codable{
    
    var sepet_yemekler:[CartFoods]?
    var success:Int?
}
