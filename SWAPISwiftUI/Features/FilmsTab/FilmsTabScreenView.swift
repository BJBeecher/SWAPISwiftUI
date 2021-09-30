//
//  FilmsTabScreenView.swift
//  SWAPISwiftUI
//
//  Created by BJ Beecher on 9/23/21.
//

import SwiftUI

extension FilmsTab {
    struct ScreenView : View {
        @StateObject private var scope = SWAPIStore.shared.scope(deriveState: ScopeState.init)
        
        var body: some View {
            Group {
                switch loadState {
                    case .idle: idleView
                    case .loading: loadingView
                    case .success(let films): successView(films: films)
                    case .failure: failureView
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
        var idleView : some View {
            Color.clear
                .onAppear(perform: viewDidAppear)
        }
        
        var loadingView : some View {
            ProgressView()
        }
        
        func successView(films: [Film]) -> some View {
            ScrollView {
                LazyVStack {
                    ForEach(films) { film in
                        VStack {
                            Text(film.title)
                            
                            Divider()
                        }
                    }
                }
            }
        }
        
        var failureView : some View {
            Text("Something went wrong")
        }
    }
}

// readers

extension FilmsTab.ScreenView {
    var loadState : LoadState<[Film]> {
        scope.state.loadState
    }
}

// actions

extension FilmsTab.ScreenView {
    func viewDidAppear(){
        scope.dispatch(FilmsTab.Actions.ViewDidAppear())
    }
}
