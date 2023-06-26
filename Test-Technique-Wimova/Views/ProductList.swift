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
    @State var _displayDetails : Bool = false
    @State var selectedProduct : Product!
    
    
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
        
        //création de 2 binding
        //fait parti du protocol router
        let displayDetails = Binding(
            //permet au routeur de naviguer vers les autres vues
            get: { self._displayDetails },
            //permet de revenir en arrière
            set: { self._displayDetails = $0 }
        )
        List{
                TextField("Rechercher", text: $filter)
                ForEach(filteredProducts) {
                    product in
                    ProductRow(product: product)
                        .onTapGesture {
                            displayDetails.wrappedValue = true
                            selectedProduct = product
                        }
                }
                
            }
            .onAppear {
                presenter.getProducts()
            }
            .fullScreenCover(isPresented : displayDetails) {
                presenter.goToProductDetails(closeScreen: displayDetails,thisProduct: selectedProduct)
            }
            
    }
}

struct ProductList_Previews: PreviewProvider {
    static var previews: some View {
        ProductList()
    }
}
