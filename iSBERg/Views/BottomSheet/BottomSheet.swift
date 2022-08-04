//
//  BottomSheet.swift
//  iSBERg
//
//  Created by Alexandr Nesterenko on 24.07.22.
//

import SwiftUI

struct BottomSheet<Content: View>: View {
    
    @Binding var isPresented: Bool
    var content: () -> Content
    
    init(isPresented: Binding<Bool>, @ViewBuilder content: @escaping () -> Content) {
        self._isPresented = isPresented
        self.content = content
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack { Spacer() }
                Spacer()
            }
            .background(Color.black.opacity(0.4).edgesIgnoringSafeArea(.all))
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation {
                    isPresented = false
                }
            }
            .transition(.opacity)
            .animation(.linear)
            
            VStack {
                Spacer()
                ZStack (alignment: .topTrailing){
                    content()
                    HStack {
                        Spacer()
                        Image("close")
                            .onTapGesture {
                                withAnimation {
                                    isPresented = false
                                }
                            }
                            .padding()
                            .contentShape(Rectangle())
                    }
                }
                .frame(maxWidth: .infinity)
                .background(AppColors.darkViolet.edgesIgnoringSafeArea(.all))
                .cornerRadius(32, corners: [.topLeft, .topRight])
            }
            .frame(maxWidth: .infinity)
            .transition(.move(edge: .bottom))
            .animation(.linear)
        }
    }
}

struct BottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheet(isPresented: .constant(true)) {
            VStack {
                Image("diamond")
                    .padding(.top, 40)
                    .padding(.bottom, 16)
                Text("Льдины")
                    .font(.system(size: 32, weight: .semibold, design: .rounded))
                    .padding(.bottom)
                Text("Хочешь быстрее стать частью нашей команды? Тогда Break the ice. Выполняй задания, собирай льдины, а затем менях их на крутые призы")
                    .multilineTextAlignment(.center)
                    .padding()
                    .font(.system(size: 18, weight: .medium, design: .rounded))
            }
        }
    }
}
