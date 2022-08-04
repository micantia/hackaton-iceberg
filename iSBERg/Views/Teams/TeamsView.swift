//
//  TeamsView.swift
//  iSBERg
//
//  Created by Alexandr Nesterenko on 24.07.22.
//

import SwiftUI

struct TeamsView: View {
    
    let teams: [TeamItem]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack (spacing: 16) {
                    ForEach(teams) { team in
                        NavigationLink {
                            TeamView(team: team)
                                .navigationTitle(team.name)
                        } label: {
                            TeamItemView(
                                id: team.id,
                                iconName: team.iconName,
                                itemName: team.name,
                                emplNum: team.emplNum
                            )
                        }
                    }
                }
            }
            .padding()
            .background(
                VStack {
                    AppColors.mainGradient.frame(height: 255)
                    Spacer()
                }
                    .edgesIgnoringSafeArea(.top)
            )
            .background(AppColors.dark
                            .edgesIgnoringSafeArea(.all))
            .navigationTitle("Команды")
        }
    }
}

struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView(teams: TeamItem.teams)
    }
}
