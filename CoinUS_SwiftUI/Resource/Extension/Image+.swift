//
//  Image+.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/19/25.
//

import SwiftUI

extension Image {
    
    func setBasic(ratio: CGFloat = 1.0, content mode: ContentMode = .fill) -> some View {
        self
            .resizable()
            .aspectRatio(ratio, contentMode: mode)
    }
}
