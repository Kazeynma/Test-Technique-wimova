//
//  ProductList.swift
//  Test-Technique-Wimova
//
//  Created by Kagnana Ith on 25/06/2023.
//

import SwiftUI

struct ProductList: View {
    
    var listProduct : [Product] = [
        Product.mock(),
        Product.mock()
    ]
    var body: some View {
        List(listProduct) {
            product in
            ProductRow(product: product)
        }
    }
}

struct ProductList_Previews: PreviewProvider {
    static var previews: some View {
        ProductList()
    }
}
