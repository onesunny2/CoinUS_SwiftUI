//
//  Text+.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/19/25.
//

import SwiftUI

extension Text {
    
    func setBasic<S: ShapeStyle>(size: CGFloat, weight: Font.Weight, color: S = .foreground) -> some View {
        self
            .font(.system(size: size, weight: weight))
            .foregroundStyle(color)
    }
}
