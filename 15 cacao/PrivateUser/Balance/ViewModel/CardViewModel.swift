//
//  CardViewModel.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 31.05.2022.
//

import SwiftUI

struct CardView: View {
    var card: Card
    var body: some View {
        expenseCardView()
    }
    @ViewBuilder
    func expenseCardView() -> some View {
        GeometryReader { proxy in
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(
                    .linearGradient(colors: [
                        Color(Constants.Colors.primaryTeal!),
                        Color(Constants.Colors.sand2!),
                        Color(Constants.Colors.primaryTeal!),
                    ], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
            VStack(spacing: 15) {
                VStack(spacing: 15) {
                    Text("May 1, 2008 - May 1, 2028")
                        .font(.callout)
                        .fontWeight(.semibold)
                    Text("$1,483.00")
                        .font(.system(size: 35, weight: .bold))
                        .lineLimit(1)
                        .padding(.bottom, 5)
                }
                .offset(y: -10)
                HStack {
                HStack(spacing: 15) {
                    Image(systemName: "arrow.down")
                        .font(.caption.bold())
                        .foregroundColor(.green)
                        .frame(width: 30, height: 30)
                        .background(.white.opacity(0.7), in: Circle())
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Income")
                            .font(.caption)
                            .opacity(0.7)
                        Text("$100.00")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .fixedSize()
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                HStack(spacing: 15) {
                    Image(systemName: "arrow.up")
                        .font(.caption.bold())
                        .foregroundColor(.red)
                        .frame(width: 30, height: 30)
                        .background(.white.opacity(0.7), in: Circle())
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Expenses")
                            .font(.caption)
                            .opacity(0.7)
                        Text("$87.40")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .fixedSize()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                }
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        .frame(height: 220)
        .padding(.top)
    }

}
