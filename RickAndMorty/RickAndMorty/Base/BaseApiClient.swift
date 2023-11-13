//
//  BaseApiClient.swift
//  RickAndMorty
//
//  Created by Javier Eduardo Rodriguez Ardila on 11/11/23.
//

import UIKit
import Combine

enum NetworkError: Error {
    case invalidURL
    case responseError
    case unknown
}

enum MethodCall {
    case get
    case post
    case put
    
    func rawValue() -> String {
        switch self {
        case .get: return "GET"
        case .post: return "POST"
        case .put: return "PUT"
        }
    }
}

class BaseAPIClient: NSObject {

    static let shared = BaseAPIClient()
    private let baseUrl: URL? = URL(string: Endpoints.baseURL)
    var cancellables = Set<AnyCancellable>()
    
    func makeRequest<T: Decodable>(endpoint: String, type: T.Type, parameters: [String: Any]? = nil, method: MethodCall = .get) -> Future<T, Error> {
        return Future<T, Error> { [weak self] promise in
            
            guard let self = self, let urlAbsolute = self.baseUrl?.appendingPathComponent(endpoint) else {
                return promise(.failure(NetworkError.invalidURL))
            }
            
            print("URL is \(urlAbsolute.absoluteString)")
            
            var request = URLRequest(url: urlAbsolute)
            request.httpMethod = method.rawValue()
            if let parameters = parameters {
                request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
            }
        
            URLSession.shared.dataTaskPublisher(for: request)
                .tryMap { (data, response) -> Data in
                    guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                        throw NetworkError.responseError
                    }
                    return data
                }
                .decode(type: T.self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { (completion) in
                    if case let .failure(error) = completion {
                        switch error {
                        case let decodingError as DecodingError:
                            promise(.failure(decodingError))
                        case let apiError as NetworkError:
                            promise(.failure(apiError))
                        default:
                            promise(.failure(NetworkError.unknown))
                        }
                    }
                }, receiveValue: {  data in
                    print(data)
                    promise(.success(data))
                })
                .store(in: &self.cancellables)
        }
    }
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("Nos perdimos por el camino, intentalo más tarde.", comment: "")
        case .responseError:
            return NSLocalizedString("Ups! no conseguimos conectar, intenta deslizar hacia abajo la pantalla.", comment: "")
        case .unknown:
            return NSLocalizedString("Ha pasado algo, intentalo más tarde.", comment: "")
        }
    }
}
