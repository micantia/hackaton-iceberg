//
//  MembersList.swift
//  iSBERg
//
//  Created by Alexandr Nesterenko on 24.07.22.
//

import SwiftUI

struct MembersList: View {
    
    let mems: [TeamMember]
    @EnvironmentObject var env: Env
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(mems) { mem in
                    HStack (spacing: 16){
                        Image(mem.photo)
                        VStack (alignment: .leading) {
                            HStack { Text(mem.name)
                                .font(.system(size: 15, weight: .medium, design: .rounded))
                                .foregroundColor(AppColors.purple02)
                                Spacer()
                            }
                            Text(mem.occupation)
                                .font(.system(size: 13, weight: .medium, design: .rounded))
                                .foregroundColor(AppColors.gray01)
                        }
                        .frame(maxWidth: .infinity)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            env.memberToShow = mem
                            env.shouldShowMember = true
                        }
                    }
                    .padding()
                    .background(AppColors.purpleDark)
                    .cornerRadius(12)
                }
            }
        }
    }
}

struct MembersList_Previews: PreviewProvider {
    static var previews: some View {
        MembersList(mems: TeamItem.teams.first!.teamMembers)
            .environmentObject(Env())
    }
}
