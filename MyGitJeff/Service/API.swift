//
//  API.swift
//  MyGitJeff
//
//  Created by jeffrey lullen on 5/3/26.
//

import Foundation

class API{
    
    enum NetworkError: Error {
        case invalidURL
        case fileNotFound
        case authFailed
        case invalidResponse
        case invalidStatusCode
        case decodingFailed
    }
    
    func fetchPosts() async throws -> [Post]{
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard httpResponse.statusCode == 200 else {
            throw NetworkError.invalidStatusCode
        }
        do {
            return try JSONDecoder().decode([Post].self, from: data)
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}
