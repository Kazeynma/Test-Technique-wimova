//
//  ProductDetails.swift
//  Test-Technique-Wimova
//
//  Created by Kagnana Ith on 25/06/2023.
//

import SwiftUI

struct ButtonModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(5)
            .font(.title)
            .foregroundColor(.black)
    }
}

struct ProductDetails: View {
    @ObservedObject var presenter : ProductPresenter
    @Binding var closeScreen : Bool
    var product : Product
    
    var body: some View {
        ScrollView {
            HStack {
                Button {
                    closeScreen.toggle()
                } label : {
                    Image(systemName: "arrow.left")
                }
                .modifier(ButtonModifier())
                Spacer()
            }
            .padding([.leading, .bottom], 5.0)
            
            if let thumbnail = presenter.thumbnail {
                Image(uiImage: thumbnail)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            
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
            
            VStack {
                ForEach(presenter.images, id: \.self) {
                    image in
                    if let image = image {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                }
            }
        }
        .onAppear {
            presenter.fetchImage(urlImg: product.thumbnail)
            presenter.fetchManyImage(arrayUrl: product.images)
        }
    }
}

struct ProductDetails_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetails(presenter: ProductPresenter(), closeScreen: .constant(false), product: Product.mock())
    }
}
