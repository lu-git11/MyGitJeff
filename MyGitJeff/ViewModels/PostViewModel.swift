//
//  PostViewModel.swift
//  MyGitJeff
//
//  Created by jeffrey lullen on 5/3/26.
//

import Foundation
import Combine

class PostViewModel: ObservableObject{
        
    @Published var post: [Post] = []
    @Published var errorMessage: String = ""
    
    let service = API()
    
    func getPosts() async {
        do {
            post = try await service.fetchPosts()
        } catch let error as API.NetworkError{
            switch error{
            case .invalidURL : errorMessage = "Invalid URL"
            case .invalidResponse : errorMessage = "Invalid Response"
            case .invalidStatusCode: errorMessage = "invalid Status Code"
            case .decodingFailed : errorMessage = "Decoding Failed"
            case .authFailed : errorMessage = "Auth Failed"
            case .fileNotFound : errorMessage = "File Not Found"
            }
        }catch{
            errorMessage = "Something went wrong..."
        }
    }
}
