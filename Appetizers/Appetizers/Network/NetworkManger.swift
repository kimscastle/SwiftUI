//
//  NetworkManger.swift
//  Appetizers
//
//  Created by uiskim on 3/24/24.
//

import UIKit

final class NetworkManger {
    
    private let cache = NSCache<NSString, UIImage>()
    
    static let shared = NetworkManger()
    private init() {}
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    func getAppetizers() async throws -> [Appetizer] {
        guard let url = URL(string: appetizerURL) else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        do {
            return try JSONDecoder().decode(AppetizerResponse.self, from: data).request
        } catch {
            throw APIError.invalidData
        }
    }
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            // 캐시성공
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
    
}
