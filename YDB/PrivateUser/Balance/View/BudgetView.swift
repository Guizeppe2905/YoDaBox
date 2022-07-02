//
//  BudgetView.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 25.05.2022.
//

import SwiftUI

struct Budget: View {
    @ObservedObject var viewModel = ViewModel()
    @ObservedObject var userSetting = UserSettings()
    @State var moveToForm = false
    @State var startAnimation = false
    @State var startCardRotation = false
    @State var selectedCard = false
    @State var cardAnimation = false
    @Namespace var animation
    var body: some View {
       VStack {
           Spacer()
           HStack(spacing: 15) {
               Spacer()
               VStack(alignment: .leading, spacing: 4) {
                   Text("Your Budget Manager")
                       .font(.custom("Avenir Next", size: 25))
                       .fontWeight(.semibold)
                       .foregroundColor(.gray)
                   Text("Press on the Card for more details")
                       .font(.custom("Avenir Next", size: 18))
               }
               .frame(maxWidth: .infinity, alignment: .leading)
               Button(action: { self.viewModel.goForm() }) {
                   HStack(alignment: .center) {
                       Image(systemName: "hexagon.fill")
                                         .foregroundColor(.gray)
                                            .overlay(content: {
                                                Circle()
                                                    .stroke(.white, lineWidth: 2)
                                                    .padding(7)
                                            })
                                            .frame(width: 40, height: 40)
                                            .background(Color.white, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                                            .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                   }
               }
           }
           .padding(.top, -20)
                VStack {
                        VStack(spacing: 5) {
                            ZStack(alignment: .center) {
                             ForEach(cards.indices.reversed(), id: \.self) { index in
                               CardView(card: cards[index])
                                    .scaleEffect(selectedCard ? 1 : index == 0 ? 1 : 0.9)
                                    .rotationEffect(.init(degrees: startAnimation ? 0 : index == 1 ? -15 : (index == 2 ? 15 : 0)))
                                    .onTapGesture {
                                        animateViews(card: CardView(card: cards[index]))
                                    }
                                    .offset(y: startAnimation ? 0 : index == 1 ? 60 : (index == 2 ? -60 : 0))
                                    .matchedGeometryEffect(id: "CARD_ANIMATION", in: animation)
                                    .rotationEffect(.init(degrees: selectedCard && startCardRotation ? -90 : 0))
                                    .zIndex(selectedCard ? 1000 : 0)
                                    .opacity(startAnimation ? selectedCard ? 1 : 0 : 1)
                                     }
                                    }
                                    .rotationEffect(.init(degrees: 90))
                                    .frame(height: getRect().width - 30)
                                    .scaleEffect(0.7)
                                    .padding(.top, -40)
                            SegmentView()
                        } .padding()
                } .padding(.top, -30)
        } .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .blur(radius: cardAnimation ? 100 : 0)
        .overlay(
            ZStack(alignment: .topTrailing, content: {
                if cardAnimation {
                    VStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Your Budget Manager")
                                .font(.custom("Avenir Next", size: 25))
                                .fontWeight(.semibold)
                                .foregroundColor(.gray)
                            Text("Check your balance")
                                .font(.custom("Avenir Next", size: 18))
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        expenseCardView()
                            .frame(width: 350, height: 200, alignment: .top)
                    Button(action: {
                        withAnimation(.interactiveSpring(response: 0.4, dampingFraction: 0.7, blendDuration: 0.5)) {
                            startCardRotation = false
                            selectedCard = false
                            cardAnimation = false
                            startAnimation = false
                        }
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.primary)
                            .clipShape(Circle())
                    }) .padding()
                        Text("If you fill in your personal profile in details, you will earn more from Your Data Box.")
                            .font(.custom("Avenir Next", size: 18))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                    }
                }
            })
        )
    }
    func animateViews(card: CardView) {
        selectedCard = true
        withAnimation(.interactiveSpring(response: 0.4, dampingFraction: 0.5, blendDuration: 0.5)) {
            startAnimation = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation(.spring()) {
                startCardRotation = true
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            withAnimation(.spring()) {
                cardAnimation = true
            }
        }
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
                    let doubleStr = String(format: "%.2f", ceil(userSetting.amountEarned * 100) / 100)
                    Text("\(doubleStr)")
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
extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
