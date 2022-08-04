//
//  CongratsView.swift
//  iSBERg
//
//  Created by Alexandr Nesterenko on 24.07.22.
//

import SwiftUI

struct CongratsView: View {
    @EnvironmentObject var env: Env
    
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Spacer()
            Image("diamond")
            Text("Ты красавчик!")
                .font(.system(size: 32, weight: .semibold, design: .rounded))
                .padding(.bottom, 16)
            Text("Ты справился с первым заданиеми получаешь свои первые льдины.А завтра мы напомним о прохождении следующего задания")
                .padding()
                .font(.system(size: 18, weight: .medium, design: .rounded))
                .multilineTextAlignment(.center)
            Spacer()
            Button("Закрыть") {
                withAnimation {
                    isPresented = false
                }
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
        .animation(.linear)
        .transition(.move(edge: .bottom))
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct CongratsView_Previews: PreviewProvider {
    static var previews: some View {
        CongratsView(isPresented: .constant(true))
            .environmentObject(Env())
    }
}
