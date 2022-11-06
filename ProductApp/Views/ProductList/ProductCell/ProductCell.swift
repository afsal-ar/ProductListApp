//
//  ProductCell.swift
//  ProductApp
//
//  Created by InApp on 05/11/22.
//

import SwiftUI
import URLImage
import AxisRatingBar

struct ProductCell: View {
    let productModel: ProductModel
    let axisMode: ARAxisMode

  
    var body: some View {
        //MARK: IMAGE LOADING
        HStack {
            URLImage(URL(string: productModel.image ?? "") ?? URL(fileURLWithPath: "https://pic.onlinewebfonts.com/svg/img_148071.png")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 120)
                
                    
            }
            Spacer()
            

            VStack {
                HStack{
                    Text(productModel.title ?? "").font(Font.custom("Poppins-Regular", size: 15))
                    Spacer()

                }
                    
                HStack(spacing: 10.0) {
                    //MARK: ADDING STAR RATING
                    
                    let constant1 = ARConstant(rating: 5,
                                               size: CGSize(width: 10, height: 10),
                                               spacing: 1,
                                               fillMode: .half,
                                               axisMode: axisMode,
                                               valueMode: .point)
                    
                    AxisRatingBar(value: .constant(CGFloat(productModel.rating?.rate ?? 2.5)), constant: constant1) {
                        ARStar(count: round(5), innerRatio: 1)
                            .stroke()
                            .fill(Color.gray)
                        
                    } foreground: {
                        ARStar(count: round(5), innerRatio: 1)
                            .fill(Color.black)
                    }
                    let formattedFloat = String(format: "%.1f", productModel.rating?.rate ?? 2.5)
                    Text("\(formattedFloat)(\(productModel.rating?.count ?? 0))").font(Font.custom("Poppins-Regular", size: 15)).multilineTextAlignment(.leading)
                    Spacer()
                }
                HStack {
                    Spacer()
                    let value = String(format: "%.0f", productModel.price ?? 30.0)
                    Text("$\(value)").font(.custom("Poppins-Regular", size: 12)).bold()
                }
            }
            Spacer()
        }
        
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(productModel: ProductModel.sampleProd(), axisMode: .horizontal)
    }
}
