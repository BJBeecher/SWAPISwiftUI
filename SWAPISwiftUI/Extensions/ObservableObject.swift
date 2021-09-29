//
//  ObservableObject.swift
//  SWAPISwiftUI
//
//  Created by BJ Beecher on 9/26/21.
//

import Foundation
import SwiftUI

extension ObservableObject {
    func publish(block: @escaping () -> Void){
        DispatchQueue.main.async {
            withAnimation {
                block()
            }
        }
    }
}
