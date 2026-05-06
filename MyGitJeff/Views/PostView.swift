//
//  PostView.swift
//  MyGitJeff
//
//  Created by jeffrey lullen on 5/3/26.
//

import SwiftUI

struct PostView: View {
    
        @StateObject private var viewModel = PostViewModel()
        
        var body: some View {
            NavigationStack{
                VStack{
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                            .padding()
                        
                        Button("Retry"){
                            Task{
                                await viewModel.getPosts()
                            }
                        }
                    }
                    
                    List(viewModel.post){
                        post in
                        
                        HStack{
                            Text("\(post.id)").font(.title3)
                                .padding()
                            Text(post.title).font(.headline)
                        }
                        .padding(5)
                    }
                }
                .navigationTitle("Posts")
                .navigationBarTitleDisplayMode(.inline)
                .task{
                    await viewModel.getPosts()
                }
            }
    }
}
#Preview{
    PostView()
}
