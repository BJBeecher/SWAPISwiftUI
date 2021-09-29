//
//  PeopleTabScreenView.swift
//  SWAPISwiftUI
//
//  Created by BJ Beecher on 9/23/21.
//

import SwiftUI

extension PeopleTab {
    struct ScreenView : View {
        @StateObject private var scope = SWAPIStore.shared.scope(deriveState: ScopeState.init)
        
        var body: some View {
            Group {
                switch loadState {
                    case .idle: idleView
                    case .loading: loadingView
                    case .success(let people): successView(people: people)
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
        
        func successView(people: [Person]) -> some View {
            ScrollView {
                LazyVStack {
                    ForEach(people){ person in
                        RowView(person: person)
                    }
                    
                    if canLoadMore {
                        loadMoreView
                            .transition(.scale)
                    }
                }
            }
        }
        
        var loadMoreView : some View {
            ProgressView()
                .padding()
                .onAppear(perform: loadNext)
        }
        
        var failureView : some View {
            Text("Something went wrong")
        }
    }
}

// readers

extension PeopleTab.ScreenView {
    var loadState : LoadState<[Person]> {
        scope.state.loadState
    }
    
    var canLoadMore : Bool {
        scope.state.canLoadMore
    }
}

// actions

extension PeopleTab.ScreenView {
    func viewDidAppear(){
        scope.dispatch(PeopleTab.Actions.ViewDidAppear())
    }
    
    func loadNext(){
        scope.dispatch(PeopleTab.Actions.LoadNext())
    }
}
