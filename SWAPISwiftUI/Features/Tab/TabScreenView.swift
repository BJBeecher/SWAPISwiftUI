//
//  TabScreenView.swift
//  SWAPISwiftUI
//
//  Created by BJ Beecher on 9/23/21.
//

import SwiftUI

extension Tab {
    struct ScreenView : View {
        var body: some View {
            TabView {
                PeopleTab.ScreenView()
                    .tabItem {
                        Label("People", systemImage: "person.2")
                    }
                
                VehicleTab.ScreenView()
                    .tabItem {
                        Label("Vehicles", systemImage: "bus.doubledecker")
                    }
                
                FilmsTab.ScreenView()
                    .tabItem {
                        Label("Films", systemImage: "film")
                    }
            }
        }
    }
}
