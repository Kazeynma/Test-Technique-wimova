//
//  ProductDetails.swift
//  Test-Technique-Wimova
//
//  Created by Kagnana Ith on 25/06/2023.
//

import SwiftUI

struct ProductDetails: View {
    @ObservedObject var presenter : ProductPresenter
    var product : Product
    var body: some View {
        ScrollView {
            HStack {
                Button {
                    
                } label : {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.black)
                }
                Spacer()
            }
            .padding([.leading, .bottom], 5.0)
            
            
            Image(product.thumbnail)
                .resizable()
                .aspectRatio(contentMode: .fill)
            HStack {
                Spacer()
                Text(product.title)
                Spacer()
                Text("\(product.price)€")
                Spacer()
            }
            .font(.title)
            
            Spacer()
            Text(product.description)
                .font(.subheadline)
            
            Divider()
            Text("Caractéristiques : ")
                .multilineTextAlignment(.leading)
            Spacer()
            VStack(alignment: .leading) {
                Text("- catégorie : \(product.category)")
                Text("- marque : \(product.brand)")
                Text("- Avis : \(product.rating)")
                Text("- Stock : \(product.stock)")
                
            }
            
            //essayer de mettre les images supplémentaire
        }
    }
}

struct ProductDetails_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetails(presenter: ProductPresenter(), product: Product.mock())
    }
}
