//
//  TabBarView.swift
//  arbuz
//
//  Created by Dias Yerlan on 18.05.2024.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case house
    case cart
}

struct TabBarView: View {
    @Binding var selectedTab: Tab
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                        .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                        .foregroundColor(selectedTab == tab ? .green : .black)
                        .font(.system(size: 22))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    
                    Spacer()
                }
            }
            Spacer(minLength: 20)
        }
        .frame(width: nil, height: 50)
        
    }
}

#Preview {
    ContentView()
}
