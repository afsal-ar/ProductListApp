//
//  ProductListView.swift
//  ProductApp
//
//  Created by InApp on 05/11/22.
//

import SwiftUI

struct ProductListView: View {
  
    @State var productModel : [ProductModel] = []
    @State var searchText : String = ""
    var body: some View {
        NavigationView {
            //MARK: TAB BAR VIEW
            TabView {
                VStack {
                    HStack {
                        //MARK: DRAWER MENU
                        Button {
                            
                        } label: {
                            Image("menu")
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color.black)
                        }
                        .frame(width: 44.5, height: 44.5)
                        
                        Spacer()
                   
                    }
                    
                    
                    VStack {
                        HStack{
                            Text("New Arrivals")
                                .multilineTextAlignment(.leading)
                                .font(Font.custom("Poppins-Regular", size: 25)).bold()
                               
                            Spacer()
                        }
                        HStack{
                            Text("Custom clothing for the modern unique man")
                                .foregroundColor(Color.gray)
                                .multilineTextAlignment(.leading)
                                .font(Font.custom("Poppins-Regular", size: 12))
                            Spacer()
                        }
                    }
                    //MARK: SEARCH UI

                    SearchVIew(textInput: $searchText, searchText: searchText)

                    //MARK: LIST UI
                    List(searchResults, id: \.title) { detailProductView in
                        
                        NavigationLink(destination: ProductDetailsView(productModel: detailProductView, axisMode: .horizontal )) {
                            ProductCell(productModel: detailProductView, axisMode: .horizontal)
                        }
                    .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1))

                        .listRowSeparator(.hidden)
                        .listStyle(.plain)
   
                    }
                    
                    .onAppear(){
                        
                        //MARK: API CALL
                        APIManager().loadDataByAlamofire(completion: { result in
                            
                            switch result {
                            case .success(let productModel):
                                self.productModel = productModel
                              
                            case .failure(let error):
                                print(error)
                            }
                        })
                    }
                  
                    
                    
                    
                }
                    .padding(.all)
                    .tabItem {
                        Image(systemName: "house.fill")
                            .foregroundColor(Color("PinkBg"))
                            .accentColor((Color("PinkBg")))
                       
                    }
             
                Text("Favourites Tab")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "heart")
                            .foregroundColor(Color.red)
                            .background(Color.green)
                       
                    }
             
                Text("Cart Tab")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "cart")
                            .padding(.all)
                       
                    }
             
                Text("Profile Tab")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                   
                    .multilineTextAlignment(.center)
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                            .renderingMode(.template)
                            .foregroundColor(Color.orange)
                                
                           
                            
                        
                            
                        
                    }
                    
            }
          
            .onAppear {
                
                //MARK: REMOVE TABBAR TRANSPARENCY IN NEW VERSION
                
                if #available(iOS 15.0, *) {
                    let appearance = UITabBarAppearance()
                    appearance.configureWithOpaqueBackground()
                    UITabBar.appearance().scrollEdgeAppearance = appearance
 
                
                    UITabBar.appearance().isOpaque = true
                    UITabBar.appearance().backgroundColor = .white
                  
                    UITabBar.appearance().barTintColor = UIColor.white
                    
                    
                }
            }

            
            

            
            
            
            
        }
        
    }
    //MARK: SEARCH LOGIC
    var searchResults: [ProductModel] {
           if searchText.isEmpty {
               return productModel
           } else {
               return productModel.filter { $0.title?.lowercased().contains(searchText.lowercased()) ?? false }
           }
       }
    
}
struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
