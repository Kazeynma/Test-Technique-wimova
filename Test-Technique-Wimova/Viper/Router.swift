//
//  Router.swift
//  Test-Technique-Wimova
//
//  Created by Kagnana Ith on 25/06/2023.
//

import Foundation
import SwiftUI

//permet de gérer la navigation entre les écrans
struct Router {
    
    func goToProductDetails(closeScreen: Binding<Bool>, thisProduct : Product) -> some View {
        let presenter = ProductPresenter()
        //récupérer le bon produit correspondant avec l'idProduct qu'on donne
        return ProductDetails(presenter: presenter, closeScreen: closeScreen, product: thisProduct)
    }
}
