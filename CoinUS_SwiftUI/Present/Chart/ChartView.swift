//
//  ChartView.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/19/25.
//

import SwiftUI

struct ChartView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Text("ChartView")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    toolBarLeft
                }
                ToolbarItem(placement: .topBarTrailing) {
                    tooBarRight
                }
            }
    }
    
    private var toolBarLeft: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: ImageLiterals.chevronLeft)
                .setSystemImage(size: 18, weight: .regular)
        }
    }
    
    private var tooBarRight: some View {
        Button {
            print("즐겨찾기 버튼")
        } label: {
            Image(systemName: ImageLiterals.star)
                .setSystemImage(size: 15, weight: .regular)
        }
    }
}

#Preview {
    ChartView()
}
