//
//  LoadState.swift
//  SWAPISwiftUI
//
//  Created by BJ Beecher on 9/24/21.
//

import Foundation

enum LoadState<Success> {
    case idle
    case loading
    case success(Success)
    case failure(Error)
}

extension LoadState {
    var isIdle : Bool {
        if case .idle = self {
            return true
        } else {
            return false
        }
    }
    
    var isLoading : Bool {
        if case .loading = self {
            return true
        } else {
            return false
        }
    }
    
    var successValue : Success? {
        if case .success(let success) = self {
            return success
        } else {
            return nil
        }
    }
    
    var failureValue : Error? {
        if case .failure(let error) = self {
            return error
        } else {
            return nil
        }
    }
}

extension LoadState {
    func mapSuccess<T>(handler: (Success) -> T) -> LoadState<T> {
        switch self {
            case .idle: return .idle
            case .loading: return .loading
            case .success(let value): return .success(handler(value))
            case .failure(let error): return .failure(error)
        }
    }
}

extension LoadState : Equatable where Success : Equatable {
    static func == (lhs: LoadState<Success>, rhs: LoadState<Success>) -> Bool {
        switch lhs {
            case .idle: return rhs.isIdle
            case .loading: return rhs.isLoading
            case .success(let success): return rhs.successValue == success
            case .failure: return rhs.failureValue != nil
        }
    }
}
