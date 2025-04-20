//
//  IconImage.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/19/25.
//

import SwiftUI

struct IconImageCell: View {
    
    let url: String
    
    var body: some View {
        if let url = URL(string: url) {
            
            let size: CGFloat = 30
            
            AsyncImage(url: url) { image in
                switch image {
                case .empty:
                    ProgressView("로딩 중")
                case .success(let image):
                    image
                        .setBasic(content: .fit)
                case .failure(let error):
                    Image(systemName: "photo")
                @unknown default:
                    Image(systemName: "photo")
                }
            }
            .foregroundStyle(.mint.opacity(0.7))
            .frame(width: size, height: size)
            .clipShape(.rect(cornerRadius: size / 2))
            .background(.clear)
        }
    }
}
