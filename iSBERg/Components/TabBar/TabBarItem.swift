//
//  TabBarItem.swift
//  iSBERg
//
//  Created by Alexandr Nesterenko on 23.07.22.
//

import SwiftUI

enum TabItem: Int, CaseIterable, Identifiable {
    case main = 0
    case team
    case help
    case profile
    
    var id: Int {
        rawValue
    }
    
    var title: String {
        switch self {
        case .main:
            return "Главная"
        case .team:
            return "Команды"
        case .profile:
            return "Профиль"
        case .help:
            return "Помощь"
        }
    }
    
    var iconName: String {
        switch self {
        case .main:
            return "home"
        case .team:
            return "coworkers"
        case .profile:
            return "user"
        case .help:
            return "help"
        }
    }
}

struct TabBarItem: View {
    
    let iconName: String
    let title: String
    
    var body: some View {
        VStack {
            Image(iconName)
                .resizable()
                .frame(width: 24, height: 24)
            Text(title)
                .font(.system(size: 12, weight: .medium, design: .rounded))
        }
        .contentShape(Rectangle())
    }
}

struct TabBarItem_Previews: PreviewProvider {
    static var previews: some View {
        TabBarItem(iconName: "home", title: "Главный")
    }
}
