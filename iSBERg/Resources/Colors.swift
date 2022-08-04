//
//  File.swift
//  iSBERg
//
//  Created by Alexandr Nesterenko on 23.07.22.
//

import Foundation
import SwiftUI

enum AppColors {
    //background: rgba(26, 26, 47, 1);
    static let purpleDark = Color(red: 26/255, green: 26/255, blue: 47/255)
    //rgba(232, 227, 255, 1)
    static let purple02 = Color(red: 232/255, green: 227/255, blue: 1)
    // rgba(244, 179, 53, 1)
    static let orange = Color(red: 244/255, green: 179/255, blue: 53/255)
    static let gray01 = Color(red: 117/255, green: 121/255, blue: 140/255) // rgba(117, 121, 140, 1)
    static let dark = Color(red: 15/255, green: 17/255, blue: 21/255)
    static let darkViolet = Color(red: 29/255, green: 28/255, blue: 49/255)
    static let purple1 = Color(red: 91/255, green: 53/255, blue: 244/255)
    static let mainGradient = LinearGradient(
        colors: [AppColors.purple1.opacity(0.4), .clear],
        startPoint: .top,
        endPoint: .bottom
    )
    
    static let roadMapCellGradient = LinearGradient(
        colors: [Color.white, AppColors.purple1],
        startPoint: .top,
        endPoint: .bottom
    )
    //rgba(150, 250, 154, 1)
    //rgba(65, 204, 70, 1)
    static let gradient1 = LinearGradient(
        colors: [
            Color(red: 150/255, green: 250/255, blue: 154/255),
            Color(red: 65/255, green: 204/255, blue: 70/255)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    //rgba(150, 232, 250, 1)
    //rgba(4, 170, 206, 1)
    static let gradient2 = LinearGradient(
        colors: [
            Color(red: 150/255, green: 232/255, blue: 250/255),
            Color(red: 4/255, green: 170/255, blue: 206/255)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    //rgba(230, 250, 150, 1)
    //rgba(202, 232, 81, 1)
    static let gradient3 = LinearGradient(
        colors: [
            Color(red: 230/255, green: 250/255, blue: 150/255),
            Color(red: 202/255, green: 232/255, blue: 81/255)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
