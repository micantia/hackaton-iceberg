//
//  MemberDetail.swift
//  iSBERg
//
//  Created by Alexandr Nesterenko on 24.07.22.
//

import SwiftUI

struct MemberDetail: View {
    
    let teamMember: TeamMember
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        Spacer()
                        Image("x")
                            .onTapGesture {
                                isPresented = false
                            }
                    }
                    .padding(.horizontal)
                    getEmployeView(for: teamMember)
                }
            }
        }
        .background(
            VStack {
                AppColors.mainGradient.frame(height: 255)
                Spacer()
            }
                .edgesIgnoringSafeArea(.top)
        )
        .background(AppColors.dark
                        .edgesIgnoringSafeArea(.all))
        .animation(.linear)
        .transition(.move(edge: .bottom))
    }
    
    @ViewBuilder
    func getEmployeView(for teamMember: TeamMember) -> some View {
        ScrollView {
            VStack (alignment: .leading) {
                if #available(iOS 15.0, *) {
                    Image("co1")
                        .resizable()
                        .cornerRadius(8)
                        .overlay {
                            ZStack {
                                LinearGradient(colors: [.clear, AppColors.gray01.opacity(0.4)], startPoint: .center, endPoint: .bottom)
                                    .cornerRadius(12)
                                VStack (alignment: .leading, spacing: 4){
                                    Spacer()
                                    HStack {Text(teamMember.name)
                                        .font(.system(size: 32, weight: .semibold, design: .rounded))
                                        .foregroundColor(AppColors.purple02)
                                        Spacer()
                                    }
                                    Text(teamMember.occupation)
                                        .font(.system(size: 18, weight: .medium, design: .rounded))
                                        .foregroundColor(AppColors.purple02)
                                }
                                .padding(16)
                            }
                        }
                        .padding([.horizontal])
                        .padding(.top)
                } else {
                    // Fallback on earlier versions
                }
                
                Text("??????????????????????:")
                    .padding(.horizontal)
                    .padding(.top, 16)
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                    .foregroundColor(AppColors.gray01)
                Text(teamMember.tassks)
                    .padding(.horizontal)
                    .padding(.top, 1)
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                    .foregroundColor(AppColors.purple02)
                
                Text("??????????:")
                    .padding(.horizontal)
                    .padding(.top, 8)
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                    .foregroundColor(AppColors.gray01)
                
                Text(teamMember.hobbies)
                    .padding(.horizontal)
                    .padding(.top, 1)
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                    .foregroundColor(AppColors.purple02)
                Text("????????????????:")
                    .padding(.horizontal)
                    .padding(.top, 8)
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                    .foregroundColor(AppColors.gray01)
                
                HStack {
                    Text("??????????????: ")
                        .padding(.horizontal)
                        .padding(.top, 1)
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                        .foregroundColor(AppColors.purple02)
                    Spacer()
                    Text("+375 (33) 123-45-67")
                        .padding(.horizontal)
                        .padding(.top, 1)
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                        .foregroundColor(AppColors.purple02)
                }
                HStack {
                    Text("Skype: ")
                        .padding(.horizontal)
                        .padding(.top, 1)
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                        .foregroundColor(AppColors.purple02)
                    Spacer()
                    Text("@thebestboy")
                        .padding(.horizontal)
                        .padding(.top, 1)
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                        .foregroundColor(AppColors.purple02)
                }
            }
        }
    }
}

struct MemberDetail_Previews: PreviewProvider {
    static var previews: some View {
        MemberDetail(teamMember: TeamMember(
            photo: "dima",
            name: "?????????????????? ??????????????",
            occupation: "Frontend ??????????????????????",
            hobbies: "???????? ?? ??????????",
            tassks: "???????????????? ?? ?????????????????? ?????? ????????????-?????????????????????????????? ????????????????. ?????????????????? ????????????, ?????????? ?????????????? ??????????, ?????????????????? ???? ???? ??????????????. ???????????????????????? ???????????????? ?????????? ????????????????????????????.",
            phone: "+375 (33) 452-43-12"
        ), isPresented: .constant(true))
    }
}
