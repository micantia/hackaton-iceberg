//
//  TeamView.swift
//  iSBERg
//
//  Created by Alexandr Nesterenko on 24.07.22.
//

import SwiftUI

struct TeamItemView: View {
    
    let id: Int
    let iconName: String
    let itemName: String
    let emplNum: Int
    
    var body: some View {
        VStack  {
            ZStack (alignment: .topLeading) {
                Image(iconName)
                    .offset(x: -16, y: -16)
                VStack (alignment: .leading, spacing: 4) {
                    Spacer()
                    HStack {
                    Text(itemName)
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .medium, design: .rounded))
                        Spacer()
                    }
                    Text("\(emplNum) человек")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 170, maxHeight: 170)
        .background(getGradient(by: id))
        .cornerRadius(12)
    }
    
    @ViewBuilder
    func getGradient(by id: Int) -> some View {
        switch id {
        case 1:
            AppColors.gradient1
        case 2:
            AppColors.gradient2
        case 3:
            AppColors.gradient3
        default:
            AppColors.gradient1
        }
    }
}

struct TeamItemView_Previews: PreviewProvider {
    static var previews: some View {
        TeamItemView(id: 1, iconName: "ibso", itemName: "ИБСО", emplNum: 10)
    }
}
