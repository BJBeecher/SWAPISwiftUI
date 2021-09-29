//
//  LoggingMiddleware.swift
//  SWAPISwiftUI
//
//  Created by BJ Beecher on 9/23/21.
//

import Foundation
import Flux

func loggingMiddleware(state: SWAPIState, action: FluxAction, environment: SWAPIEnvironment) -> FluxAction? {
    print(Date(), ":", action); return nil
}
