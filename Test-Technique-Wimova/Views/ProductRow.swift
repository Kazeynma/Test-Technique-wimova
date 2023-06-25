//
//  ProductRow.swift
//  Test-Technique-Wimova
//
//  Created by Kagnana Ith on 25/06/2023.
//

import SwiftUI

struct ProductRow: View {
    var product : Product
    var body: some View {
        HStack {
            Spacer()
            Text(product.title)
            Spacer()
            Text(" \(product.price)€")
            Spacer()
        }
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: Product.mock())
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
