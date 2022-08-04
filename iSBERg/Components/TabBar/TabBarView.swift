//
//  TabBarView.swift
//  iSBERg
//
//  Created by Alexandr Nesterenko on 23.07.22.
//

import SwiftUI

struct TabBarView: View {
    
    @Binding var selectedTab: TabItem
    
    var body: some View {
        HStack {
            ForEach(TabItem.allCases){ item in
                TabBarItem(iconName: item.iconName, title: item.title)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selectedTab = item
                    }
                    .opacity(item == selectedTab ? 1 : 0.5)
                    .animation(.linear(duration: 0.2))
                    .border(width: item == selectedTab ? 2 : 0, edges: [.top], color: AppColors.purple1)
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selectedTab: .constant(.main))
    }
}
