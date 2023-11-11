//
//  Characters.swift
//  RickAndMorty
//
//  Created by Javier Eduardo Rodriguez Ardila on 9/11/23.
//

import Foundation

// MARK: - Characters
struct Characters: Codable {
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

// MARK: - Gender
enum Gender: Codable {
    case female
    case male
    case unknown
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}

// MARK: - Species
enum Species: Codable {
    case alien
    case human
}

// MARK: - Status
enum Status: Codable {
    case alive
    case dead
    case unknown
}
