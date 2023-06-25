//
//  ProductList.swift
//  Test-Technique-Wimova
//
//  Created by Kagnana Ith on 25/06/2023.
//

import SwiftUI

struct ProductList: View {
    //Récupérer la liste de produit donné par le presenter
    @StateObject var presenter = ProductPresenter()
    
    
    @State var filter : String = ""
    
    //var listProduct : [Product] = [
    //  Product.mock(),
    //  Product.mock()
    //]

    var filteredProducts : [Product] {
        presenter.products.filter {
            product in (
                (product.title.lowercased()).contains(filter.lowercased()) ||
                (product.description.lowercased()).contains(filter.lowercased()) ||
                filter == ""
            )
        }
    }
    
    var body: some View {
        List{
            TextField("Rechercher", text: $filter)
            ForEach(filteredProducts) {
                product in
                ProductRow(product: product)
            }
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
