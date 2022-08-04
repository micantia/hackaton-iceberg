//
//  Main.swift
//  iSBERg
//
//  Created by Alexandr Nesterenko on 23.07.22.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var env: Env
    
    var body: some View {
        ZStack {
            VStack {
                switch env.selectedTab {
                case .main:
                    Home()
                        .environmentObject(env)
                case .team:
                    TeamsView(teams: TeamItem.teams)
                        .environmentObject(env)
                case .help:
                    ChatView()
                default:
                    EmptyView()
                }
                
                TabBarView(selectedTab: $env.selectedTab)
                    .frame(height: 80)
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
            
            if env.shouldShowIces {
                BottomSheet(isPresented: $env.shouldShowIces) {
                    VStack {
                        Image("diamond")
                            .padding(.top, 40)
                            .padding(.bottom, 16)
                        Text("Льдины")
                            .font(.system(size: 32, weight: .semibold, design: .rounded))
                            .padding(.bottom, 10)
                        Text("Хочешь быстрее стать частью нашей команды? Тогда Break the ice. Выполняй задания, собирай льдины, а затем менях их на крутые призы")
                            .multilineTextAlignment(.center)
                            .padding([.horizontal, .bottom])
                            .padding(.bottom)
                            .font(.system(size: 18, weight: .medium, design: .rounded))
                    }
                }
            }
            
            if env.shouldShowRoadItem {
                let selectedRoadItem = env.roadMapState.roadItems[env.selectedRoadItemIndex]
                BottomSheet(isPresented: $env.shouldShowRoadItem) {
                    VStack (alignment: .leading){
                        Image(selectedRoadItem.imageName)
                            .resizable()
                            .frame(height: 225)
                        
                        HStack {
                            Text(selectedRoadItem.title)
                                .font(.system(size: 32, weight: .semibold, design: .rounded))
                                .padding(.bottom, 10)
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.top, 10)
                        
                        HStack {
                            Text(selectedRoadItem.description)
                                .padding(.bottom)
                                .font(.system(size: 18, weight: .medium, design: .rounded))
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        Button("Познакомиться") {
                            withAnimation {
                                env.shouldShowRoadItem = false
                                env.shouldShowCourse = true
                            }
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .contentShape(Rectangle())
                        .padding()
                        .background(AppColors.purple1)
                        .cornerRadius(12)
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        .padding()
                    }
                }
            }
            
            if env.shouldShowCourse {
                StagesView(isPresented: $env.shouldShowCourse)
            }
            
            if env.shouldShowCongrats {
                CongratsView(isPresented: $env.shouldShowCongrats)
            }
            
            if env.shouldShowMember {
                MemberDetail(teamMember: env.memberToShow!, isPresented: $env.shouldShowMember)
            }
        }
    }
    
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Env())
    }
}
