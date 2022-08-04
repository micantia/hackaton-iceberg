//
//  Home.swift
//  iSBERg
//
//  Created by Alexandr Nesterenko on 23.07.22.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var env: Env
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                LazyVStack (alignment: .leading, spacing: 0) {
                    header
                    trialProgress
                    roadMap
                }
                .padding(.bottom)
            }
            .navigationBarHidden(true)
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
    }
    
    var header: some View {
        VStack {
            Spacer()
            HStack {
                Text("Привет, \n\(env.user.firstName ?? "Коллега")!")
                    .foregroundColor(AppColors.purple02)
                    .font(.system(size: 32, weight: .semibold, design: .rounded))
                
                Spacer()
                
                HStack (spacing: 2) {
                    Image("diamond")
                        .resizable()
                        .frame(width: 30, height: 29)
                        .onTapGesture {
                            withAnimation {
                                env.shouldShowIces = true
                            }
                        }
                    
                    Text("\(env.user.ices)")
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                }
            }
        }
        .frame(height: 150)
        .padding(.horizontal, 16)
    
    }
    
    var trialProgress: some View {
        VStack {
            HStack {
                Text("Испытательный срок")
                    .foregroundColor(AppColors.purple02)
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                Spacer()
                Text("1/90")
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(Color.orange)
                    .cornerRadius(20)
            }
            
            ZStack (alignment: .leading){
                RoundedRectangle(cornerRadius: 4)
                    .frame(height: 4)
                
                RoundedRectangle(cornerRadius: 4)
                    .foregroundColor(AppColors.orange)
                    .frame(width: 4,height: 4)
            }
        }
        .padding()
        .background(AppColors.darkViolet)
        .cornerRadius(12)
        .padding()
        .padding(.bottom)
    }
    
    var roadMap: some View {
        ForEach(
            Array(zip(env.roadMapState.roadItems.indices, env.roadMapState.roadItems)),
            id: \.0
        ) { (offset, item) in
            if offset != 0 {
                RoadMapRoadRow(
                    alignment: offset % 2 == 0 ? .rightToLeft : .leftToRight,
                    completed: item.status != .locked
                )
                    .frame(height: 120)
            }
            
            
            RoadMapRow(
                id: item.id,
                title: item.title,
                subtitle: item.status == .completed ? item.success : item.subtitle,
                status: item.status,
                alignment: offset % 2 == 0 ? .leftToRight : .rightToLeft
            )
                .padding(.horizontal)
                .contentShape(Rectangle())
                .onTapGesture {
                    if item.status == .active {
                        env.selectedRoadItemIndex = offset
                        withAnimation {
                            env.shouldShowRoadItem = true
                        }
                    }
                }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(Env())
    }
}
