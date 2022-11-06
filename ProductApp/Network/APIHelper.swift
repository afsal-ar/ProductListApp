//
//  APIHelper.swift
//  ProductApp
//
//  Created by InApp on 05/11/22.
//

import Foundation
import Alamofire
class APIManager: ObservableObject {
    @Published var products = [ProductModel]()
   
     let api_url_base = "https://fakestoreapi.com/products"

    public func loadDataByAlamofire(completion: @escaping (Result<[ProductModel], Error>) -> ()) {
        let req = AF.request("\(api_url_base)")
        req.responseData { response in
            switch response.result {
                case .success(let data):
                    do {
                        //MARK: HANDLE SUCCESS
                        let products = try JSONDecoder().decode([ProductModel].self, from: data)
                        DispatchQueue.main.async {
                                            self.products = products
                          
                            completion(.success(products))

                                        }
                     
                    } catch {
                    
                        print("Error while decoding response: \(response.error?.localizedDescription ?? "Error") from: \(String(data: data, encoding: .utf8) ?? "")")
                    }
                case .failure(let error):
                    // Handle  error
                print(error.localizedDescription)
                completion(.failure(error))
                }
        }

    }
}
