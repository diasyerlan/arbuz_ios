//
//  Home.swift
//  arbuz
//
//  Created by Dias Yerlan on 15.05.2024.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 15, content: {
                ForEach(1...10, id: \.self) { count in
                    /*@START_MENU_TOKEN@*/Text("Placeholder \(count)")/*@END_MENU_TOKEN@*/
                }
            })
        }
    }
}

#Preview {
    Home()
}
