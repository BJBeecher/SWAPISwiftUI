//
//  IMage.swift
//  SWAPISwiftUI
//
//  Created by BJ Beecher on 9/25/21.
//

import SwiftUI

struct URLImageView : View {
    let url : URL
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        switch loadState {
            case .idle: idleView
            case .loading: loadingView
            case .success(let uiImage): successView(uiImage: uiImage)
            case .failure: failureView
        }
    }
    
    var idleView : some View {
        Color.clear
            .onAppear(perform: viewDidAppear)
    }
    
    var loadingView : some View {
        ProgressView()
    }
    
    func successView(uiImage: UIImage) -> some View {
        Image(uiImage: uiImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
    
    var failureView : some View {
        Image(systemName: "questionmark")
    }
}

// readers

extension URLImageView {
    var loadState : LoadState<UIImage> {
        viewModel.loadState
    }
}

extension URLImageView {
    func viewDidAppear() {
        viewModel.viewDidAppear(url: url)
    }
}
