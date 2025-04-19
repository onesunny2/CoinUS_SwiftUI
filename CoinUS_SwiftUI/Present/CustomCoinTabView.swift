//
//  CoinTabView.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/19/25.
//

import SwiftUI

struct TabItem: Identifiable {
    let id = UUID()
    let icon: String
    let color: Color
}

struct CustomCoinTabView: View {
    
    @Binding var selectedTab: Int
    let tabItems: [TabItem]
    
    private let horizontalPadding: CGFloat = 60
    
    var body: some View {
        HStack(spacing: 0) {
            tabIcons()
        }
        .padding(.horizontal, horizontalPadding)
        .padding(.vertical, 16)
        .background(
            tabBackground()
        )
        .frame(height: 60)
    }
    
    private func tabIcons() -> some View {
        ForEach(Array(tabItems.enumerated()), id: \.element.id) { index, item in
            Button(action: {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    selectedTab = index
                }
            }) {
                
                Image(systemName: item.icon)
                    .font(.system(size: 24, weight: selectedTab == index ? .bold : .regular))
                    .scaleEffect(selectedTab == index ? 1.2 : 1.0)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(selectedTab == index ? item.color : .gray)
            }
        }
    }
    
    private func tabBackground() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 35)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 5)
            
            if tabItems.indices.contains(selectedTab) {
                indicatorView
            }
        } .padding(.horizontal, horizontalPadding)
    }
   
    private var indicatorView: some View {
        let itemWidth = UIScreen.main.bounds.width / CGFloat(tabItems.count) - 40
        let totalWidth = UIScreen.main.bounds.width - (horizontalPadding * 2)
        let halfWidth = totalWidth / 2
        let itemSpacing = totalWidth / CGFloat(tabItems.count)
        
        // x 오프셋 계산을 여러 단계로 나눔
        let baseOffset = CGFloat(selectedTab) * itemSpacing
        let centeringOffset = -halfWidth
        let finalAdjustment = itemSpacing / 2
        let xOffset = baseOffset + centeringOffset + finalAdjustment
        
        return RoundedRectangle(cornerRadius: 25)
            .fill(tabItems[selectedTab].color.opacity(0.2))
            .frame(width: itemWidth - 20, height: 50)
            .offset(x: xOffset, y: 0)
            .animation(.spring(response: 0.3, dampingFraction: 0.7), value: selectedTab)
    }
}
