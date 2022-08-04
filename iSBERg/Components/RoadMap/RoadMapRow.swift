//
//  RoadMapRow.swift
//  iSBERg
//
//  Created by Alexandr Nesterenko on 23.07.22.
//

import SwiftUI

enum RoadMapRowAlignment {
    case leftToRight
    case rightToLeft
    
    var toHorizontalAlignment: HorizontalAlignment {
        switch self {
        case .leftToRight:
            return .leading
        case .rightToLeft:
            return .trailing
        }
    }
}


struct RoadMapRow: View {
    
    let id: Int
    let title: String
    let subtitle: String
    let status: RoadItemStatus
    let alignment: RoadMapRowAlignment
    
    var body: some View {
        HStack (spacing: 16) {
            switch alignment {
            case .leftToRight:
                numberCell
                info
                Spacer()
            case .rightToLeft:
                Spacer()
                info
                numberCell
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    var numberCell: some View {
        ZStack (alignment: .topTrailing){
            Text("\(id)")
                .font(.system(size: 18, weight: .medium, design: .rounded))
                .frame(width: 50, height: 50)
                .background(backgroundForStatus)
                .cornerRadius(8)
                .overlay(
                    overlayForStatus
                )
                .shadow(color: AppColors.purple1, radius: 10, x: 0, y: 0)
            if status == .completed {
                Image("check")
                    .offset(x: 10, y: -10)
            }
        }
    }
    
    var info: some View {
        VStack (alignment: alignment.toHorizontalAlignment){
            Text(title)
                .font(.system(size: 18, weight: .medium, design: .rounded))
                .foregroundColor(colorForStatus)
                .lineLimit(1)
            Text(subtitle)
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundColor(colorForStatus)
        }
    }
    
    var colorForStatus: Color {
        switch status {
        case .active:
            return AppColors.purple02
        case .completed:
            return AppColors.purple02
        case .locked:
            return AppColors.gray01
        }
    }
    
    @ViewBuilder
    var overlayForStatus: some View {
        switch status {
        case .active, .completed:
            RoundedRectangle(cornerRadius: 8)
                .stroke(
                    AppColors.roadMapCellGradient,
                    lineWidth: 1
                )
        case .locked:
            RoundedRectangle(cornerRadius: 8)
                .stroke(
                    AppColors.gray01,
                    lineWidth: 1
                )
        }
    }
    
    var backgroundForStatus: Color {
        switch status {
        case .active, .completed:
            return AppColors.purple1
        case .locked:
            return .clear
        }
    }
}

struct RoadMapRow_Previews: PreviewProvider {
    static var previews: some View {
        RoadMapRow(id: 1, title: "Твоя команда и офис", subtitle: "Достижение не достигнуто", status: .active, alignment: .leftToRight)
        RoadMapRow(id: 2, title: "Твоя команда и офис", subtitle: "Достижение не достигнуто", status: .locked, alignment: .rightToLeft)
    }
}
