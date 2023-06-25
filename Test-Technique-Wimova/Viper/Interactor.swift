//
//  Interactor.swift
//  Test-Technique-Wimova
//
//  Created by Kagnana Ith on 25/06/2023.
//

import Foundation

//L'interactor va communiquer avec le dataModel et le presenter
class Interactor : ObservableObject {
    //@Published permet à la vue d'écouter aux changements et de faire des updates
    @Published var dataModel : DataModel
    
    init() {
        dataModel = DataModel()
    }
    
    func getProducts() {
        dataModel.getProducts()
    }
}
