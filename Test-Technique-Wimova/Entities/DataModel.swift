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
    
    //fonction qui permet de récupérer les données du lien
    func getProducts() -> Void{
        let url = URL(string: "https://dummyjson.com/products/search?q=phone")!
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            if error != nil {
                return
            }
            guard let data = data else {
                return
            }
            
            //decode JSON 
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

