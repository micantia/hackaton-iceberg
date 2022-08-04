//
//  TeamView.swift
//  iSBERg
//
//  Created by Alexandr Nesterenko on 24.07.22.
//

import SwiftUI

enum TeamViewSegment: Hashable {
    case desc
    case members
}

struct TeamView: View {
    let team: TeamItem
    
    @State var segment: TeamViewSegment = .desc
    @State var shouldPresentUser = false
    @EnvironmentObject var env: Env
    
    var body: some View {
        VStack (alignment: .leading) {
            Picker("п", selection: $segment) {
                Text("Описание")
                    .tag(TeamViewSegment.desc)
                Text("Состав команды")
                    .tag(TeamViewSegment.members)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.vertical, 4)
            
            switch segment {
            case .desc:
                getTeamDesc()
            case .members:
                MembersList(mems: team.teamMembers)
                    .environmentObject(env)
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
    }
    
    @ViewBuilder
    func getTeamDesc() -> some View {
        Image(team.teamPhoto)
            .resizable()
            .frame(height: 180)
            .padding(.bottom, 16)
        Text("Описание: ")
            .foregroundColor(AppColors.gray01)
            .font(.system(size: 15, weight: .medium, design: .rounded))
            .padding(.bottom, 2)
        Text(team.description)
            .foregroundColor(AppColors.purple02)
            .font(.system(size: 15, weight: .medium, design: .rounded))
        Spacer()
    }
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView(team: TeamItem.teams.first!)
            .environmentObject(Env())
    }
}
