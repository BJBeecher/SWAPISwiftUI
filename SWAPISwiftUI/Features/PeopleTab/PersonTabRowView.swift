//
//  PersonRowView.swift
//  SWAPISwiftUI
//
//  Created by BJ Beecher on 9/25/21.
//

import SwiftUI

extension PeopleTab {
    struct RowView : View {
        let person : Person
        
        var body: some View {
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 16) {
                        Text(person.name)
                            .font(.headline)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            attributeView(label: "Eye Color:", value: person.eyeColor)
                            
                            attributeView(label: "Hair Color:", value: person.hairColor)
                            
                            attributeView(label: "Height:", value: person.height)
                            
                            attributeView(label: "Weigth:", value: person.mass)
                        }
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                }.padding()
                
                Divider()
            }
        }
        
        func attributeView(label: String, value: String) -> some View {
            Group {
                Text(label + " ").foregroundColor(.secondary) + Text(value)
            }.font(.subheadline)
        }
    }
}
