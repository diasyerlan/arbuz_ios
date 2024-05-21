//
//  LoadingView.swift
//  arbuz_ios
//
//  Created by Dias Yerlan on 21.05.2024.
//

import SwiftUI

struct LoadingView: View {
    var isForCard: Bool
    var body: some View {
        ZStack {
            Spacer()
                .background(isForCard ? Color.white : Color.black.opacity(0.1))
                .ignoresSafeArea()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .black))
                .scaleEffect(3)
        }
    }
}


