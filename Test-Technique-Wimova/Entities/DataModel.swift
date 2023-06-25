//
//  DataModel.swift
//  Test-Technique-Wimova
//
//  Created by Kagnana Ith on 25/06/2023.
//

import Foundation
import Combine

final class DataModel : ObservableObject {
    @Published var products : [Product] = []
}

