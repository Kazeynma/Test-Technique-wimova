//
//  DataModel.swift
//  Test-Technique-Wimova
//
//  Created by Kagnana Ith on 25/06/2023.
//

import Foundation
import Combine

final class DataModel : ObservableObject {
    @Published var products : [Product] = []
    
    func getProducts() -> Void{
        let url = URL(string: "https://dummyjson.com/products/search?q=phone")!
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) {
            data, response, error in
            if error != nil {
                return
            }
            guard let data = data else {
                return
            }
            
            do {
                let response = try JSONDecoder().decode(Response.self, from: data)
                self.products = response.products
            } catch {
                print("Error : \(error)")
            }
                
        }
        task.resume()
    }
}

