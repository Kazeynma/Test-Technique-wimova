//
//  ProductPresenter.swift
//  Test-Technique-Wimova
//
//  Created by Kagnana Ith on 25/06/2023.
//

import Foundation
import SwiftUI
import Combine

//Le presenter va intéragir avec les view, l'interactor et le router
//C'est celui qui va apporter aux views les données
class ProductPresenter : ObservableObject {
    //@Published permet à la vue d'écouter aux changements et de faire des updates
    @Published var products : [Product] = []
    @Published var thumbnail : UIImage? = nil
    @Published var images : [UIImage?] = []
    private var interactor = Interactor()
    private var router = Router()
    
    //Toutes les "subscriptions" seront actives tant que le presenter est là
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        //permet de créer un "publisher" qui va écouter tous les changements dans la collection produit du datamodel
        interactor.dataModel.$products
            .assign(to: \.products, on: self)
            .store(in: &cancellables)
        
        interactor.dataModel.$thumbnail
            .assign(to: \.thumbnail, on: self)
            .store(in: &cancellables)
        
        interactor.dataModel.$images
            .assign(to: \.images, on: self)
            .store(in: &cancellables)
    }
    
    //dataModel
    
    func getProducts() {
        interactor.getProducts()
    }
    
    func fetchImage(urlImg: String) {
        interactor.fetchImage(urlImg: urlImg)
    }
    
    func fetchManyImage(arrayUrl: [String]) {
        interactor.fetchManyImage(arrayUrl: arrayUrl)
    }
    //router
    
    func goToProductDetails(closeScreen: Binding<Bool>, thisProduct : Product) -> some View {
        router.goToProductDetails(closeScreen: closeScreen, thisProduct: thisProduct)
    }
}
