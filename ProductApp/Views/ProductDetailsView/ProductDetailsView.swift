//
//  ProductDetailsView.swift
//  ProductApp
//
//  Created by InApp on 06/11/22.
//

import SwiftUI
import URLImage
import AxisRatingBar
struct ProductDetailsView: View {
    @State var productModel: ProductModel
    let axisMode: ARAxisMode
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
 
  
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 30) {
                
                HStack {
                    //MARK: Back BUTTON
                    
                    
                    Button {
                        //MARK: POP VIEW
                        self.presentationMode.wrappedValue.dismiss()
                     
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.black)
                            .padding(.leading)
                    }
                    .frame(width: 44.5, height: 44.5) // END DRAWER MENU
                    
                    Spacer()
                    
                    //MARK: HEART ICON
                    Button {
                        
                    } label: {
                        Image(systemName: "suit.heart.fill")
                            .foregroundColor(.red)
                            .padding(8)
                            .background(Color.white, in: Circle())
                            .padding(.trailing)
                    }
                    .frame(width: 44.5,height: 44.5)
                    
                }
                
                URLImage(URL(string: productModel.image ?? "") ?? URL(fileURLWithPath: "https://pic.onlinewebfonts.com/svg/img_148071.png")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                  
                        .frame(width:UIScreen.main.bounds.size.width,height: geometry.size.height * 0.33)

                            .foregroundColor((Color("GreyBg")))
                    
                    
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text(productModel.category ?? "")
                            .foregroundColor(Color.gray)
                        
                            .multilineTextAlignment(.leading)
                            .font(Font.custom("Poppins-Regular", size: 15))
                        Spacer()
                    }
                    HStack {
                        Text(productModel.title ?? "")
                        
                            .multilineTextAlignment(.leading)
                            .font(Font.custom("Poppins-Regular", size: 18)).bold()
                        Spacer()
                    }
                    HStack(spacing: 20.0) {
                        let constant1 = ARConstant(rating: 5,
                                                   size: CGSize(width: 20, height: 20),
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
                        Text("\(formattedFloat)(\(productModel.rating?.count ?? 0))").font(Font.custom("Poppins-Regular", size: 15))
                        
                    }
                   
                    Text(productModel.description ?? "")
                        .padding(.top, 15.0)
                        .font(Font.custom("Poppins-Regular", size: 15))
                    Spacer()
                    HStack {
                        
                        let value = String(format: "%.0f", productModel.price ?? 30.0)
                        Text("$\(value)")
                            .font(Font.custom("Poppins-Regular", size: 20)).bold()
                        
                        Spacer()
                        
                        //MARK: ADD TO CART BUTTON
                        Button {
                            
                        } label: {
                            
                            
                            Text("Add to cart")
                          
                                .foregroundColor(Color.white)
                                .padding(.all)
                            
                                .background(Color("PinkBg").opacity(1.0))
                            
                                .cornerRadius(10.0)
                            
                        }
                    }
                }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .background(
                        Color.white
                            .opacity(1.0)
                            .cornerRadius(20)
                            .ignoresSafeArea(.container, edges: .bottom)
                    )
            }
            .background(Color("GreyBg"))
        }
        .navigationBarBackButtonHidden(true)
           


        
        }
    }

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(productModel:ProductModel.sampleProd(), axisMode: .horizontal)
    }
}
