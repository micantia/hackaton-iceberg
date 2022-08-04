//
//  Input.swift
//  iSBERg
//
//  Created by Alexandr Nesterenko on 24.07.22.
//

import SwiftUI

struct Input: View {
    
    @Binding var text: String
    let placeholder: String
    
    @State var isEditing: Bool = false
    
    var body: some View {
        TextField(placeholder, text: $text, onEditingChanged: {
            isEditing = $0
        })
            .font(.system(size: 15, weight: .medium, design: .rounded))
            .padding()
            .background(AppColors.purpleDark)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke()
                    .foregroundColor(isEditing ? .white : .clear)
            )
    }
}

struct Input_Previews: PreviewProvider {
    static var previews: some View {
        Input(text: .constant("asd"), placeholder: "Фамилия")
    }
}
