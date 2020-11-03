//
//  Apollo.swift
//  GraphQLCountry
//
//  Created by Amr Fawzy on 10/27/20.
//

import Foundation
import Apollo

class Network{
    
    static let shared = Network()
    lazy var apollo = ApolloClient(url:  URL(string: "https://countries.trevorblades.com/")!)
}
