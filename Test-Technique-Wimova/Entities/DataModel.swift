//
//  DataModel.swift
//  Test-Technique-Wimova
//
//  Created by Kagnana Ith on 25/06/2023.
//

import Foundation
import Combine
import SwiftUI

final class DataModel : ObservableObject {
    @Published var products : [Product] = []
    @Published var thumbnail : UIImage? = nil
    @Published var images : [UIImage?] = []
    
    //fonction qui permet de récupérer les données du lien
    func getProducts() -> Void{
        let url = URL(string: "https://dummyjson.com/products/search?q=phone")!
        let task = URLSession.shared.dataTask(with: url) {
            data, _, error in
            if error != nil {
                return
            }
            guard let data = data else {
                return
            }
            
            //decode JSON 
            do {
                let response = try JSONDecoder().decode(Response.self, from: data)
                DispatchQueue.main.async {
                    self.products = response.products
                }
            } catch {
                print("Error : \(error)")
            }
                
        }
        task.resume()
    }
    
    //fonction qui permet de récupérer l'image de couverture
    func fetchImage(urlImg : String) {
        let url = URL(string: urlImg)!
        let task =  URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error loading image: \(error)")
                return
            }
            
            guard let data = data else {
                return
            }
            
            if let loadedImage = UIImage(data: data) {
                //permet de dispatch (d'exécuter)le code sur la file principale de manière asynchrone
                //en effet, la "concurrency" permet d'exécuter plusieurs tâches en même temps
                //pour éviter des erreurs on va utiliser DispatchQueue.main.async
                DispatchQueue.main.async {
                    self.thumbnail = loadedImage
                }
            }
        }
        task.resume()
    }
    
    //fontion qui permet de récupérer les autres images
    func fetchManyImage(arrayUrl : [String]) {
        //Permet de grouper plusieurs tâches en une seule
        let group = DispatchGroup()
        
            for url in arrayUrl {
                //explique quand le block rentre dans le groupe
                group.enter()
                
                if let imageUrl = URL(string: url) {
                    let task = URLSession.shared.dataTask(with: imageUrl) { data, _, error in
                        if let error = error {
                            print("Error loading image: \(error)")
                            //en cas d'erreur on va quitter le groupe
                            group.leave()
                        }
                        
                        guard let data = data else {
                            return
                        }
                        
                        if let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                self.images.append(image)
                            }
                        }
                    }
                    task.resume()
                }
            }
    }
}

