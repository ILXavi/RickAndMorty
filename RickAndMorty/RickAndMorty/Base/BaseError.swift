//
//  BaseError.swift
//  RickAndMorty
//
//  Created by Javier Eduardo Rodriguez Ardila on 9/11/23.
//

import Foundation

enum BaseError: Error {
    case generic
    case noInternetConnection
    
    func description() -> String {
        
        var description: String = ""
        
        switch self {
        case .generic: description = "error_generic"
        case .noInternetConnection: description = "error_no_internet_connection"
        }
        
        return description
    }
}
