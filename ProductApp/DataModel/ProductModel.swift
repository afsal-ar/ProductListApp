//
//  ProductModel.swift
//  ProductApp
//
//  Created by InApp on 05/11/22.
//

import Foundation
struct ProductModel : Decodable {
    
    let id : Int?
    let title : String?
    let price : Double?
    let description : String?
    let category : String?
    let image : String?
    let rating : RatingModel?

    
    static func sampleProd() -> ProductModel {

        
        ProductModel(id: 0, title: "Sample Title adasdlajdhjasdjassdasd", price: 20.0, description: "Test Desc", category: "Test Category", image: "https://pic.onlinewebfonts.com/svg/img_148071.png", rating: RatingModel(rate: 2.5, count: 120))
    }
    
}
