//
//  OnboardingView.swift
//  iSBERg
//
//  Created by Alexandr Nesterenko on 23.07.22.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject var env: Env
    @State var selectedItemIndex: Int = 0
    let onboardingItems: [OnboardingItem]
    
    var body: some View {
        VStack {
            navBar
            
            GeometryReader { reader in
                ScrollView (.horizontal, showsIndicators: false) {
                    ScrollViewReader { scrollReader in
                        LazyHStack {
                            ForEach(0..<onboardingItems.count, id: \.self) {
                                getOnboardingCard(by: $0)
                                    .id($0)
                                    .frame(width: reader.size.width)
                            }
                            .onChange(of: selectedItemIndex) { newValue in
                                withAnimation {
                                    scrollReader.scrollTo(newValue, anchor: .center)
                                }
                            }
                        }
                    }
                }
            }
            HStack {
                ForEach (0..<onboardingItems.count) { index in
                    Circle()
                        .frame(width: 6, height: 6)
                        .opacity(index == selectedItemIndex ? 1 : 0.5)
                        .animation(.linear(duration: 0.2))
                }
            }
        }
        .background(
            VStack {
                AppColors.mainGradient.frame(height: 255)
                Spacer()
            }
                .edgesIgnoringSafeArea(.all)
        )
        .background(AppColors.dark
                        .edgesIgnoringSafeArea(.all))
    }
    
    var navBar: some View {
        HStack {
            Image("back")
                .resizable()
                .frame(width: 22, height: 22)
                .onTapGesture {
                    selectedItemIndex = max(selectedItemIndex - 1, 0)
                }
                .opacity(selectedItemIndex == 0 ? 0 : 1)
                .animation(.linear(duration: 0.2))
            Spacer()
        }
        .padding()
    }
    
    @ViewBuilder
    func getOnboardingCard(by index: Int) -> some View {
        VStack {
            Image(onboardingItems[index].imageName)
            Text(onboardingItems[index].title)
                .font(.system(size: 32, weight: .semibold, design: .rounded))
                .padding(.bottom, 16)
            Text(onboardingItems[index].description)
                .font(.system(size: 18, weight: .medium, design: .rounded))
                .multilineTextAlignment(.center)
            Spacer()
            Button("Продолжить") {
                if selectedItemIndex == onboardingItems.indices.last {
                    withAnimation {
                        env.onboardingCompleted = true
                    }
                }
                selectedItemIndex = min(index + 1, onboardingItems.count - 1)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .contentShape(Rectangle())
            .padding()
            .background(AppColors.purple1)
            .cornerRadius(12)
            .foregroundColor(.white)
            .font(.system(size: 18, weight: .medium, design: .rounded))
            .padding()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(onboardingItems: OnboardingItem.items)
    }
}
