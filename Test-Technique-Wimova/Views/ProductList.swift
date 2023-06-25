//
//  ProductList.swift
//  Test-Technique-Wimova
//
//  Created by Kagnana Ith on 25/06/2023.
//

import SwiftUI

struct ProductList: View {
    //Récupérer le produit donné par le presenter
    @StateObject var presenter = ProductPresenter()
    
    var listProduct : [Product] = [
        Product.mock(),
        Product.mock()
    ]
    var body: some View {
        List(presenter.products) {
            product in
            ProductRow(product: product)
        }
        .onAppear {
            presenter.getProducts()
    }
        
        }
}

struct ProductList_Previews: PreviewProvider {
    static var previews: some View {
        ProductList()
    }
}
