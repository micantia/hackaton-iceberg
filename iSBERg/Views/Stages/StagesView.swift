//
//  StagesView.swift
//  iSBERg
//
//  Created by Alexandr Nesterenko on 24.07.22.
//

import SwiftUI

enum StageType {
    case person
    case mentor
    case cv
    case completed
    case prestage
}

struct Stage: Identifiable{
    let id = UUID()
    let title: String
    let buttonName: String
    let buttonImageName: String
    let type: StageType
    
}

struct StagesView: View {
    
    @EnvironmentObject var env: Env
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var occupation: String = ""
    @State var hobbie: String = ""
    @State var phone: String = ""
    @State var telegram: String = ""
    
    @State var stepsNumber: CGFloat = 6
    @State var progress: CGFloat = 0
    
    let ids = ["co1", "co2", "co3",  "co4", "pre", "cv"]
    
    @Binding var isPresented: Bool
    
    var body: some View {
        GeometryReader { geometry in
            VStack (spacing: 0) {
                navBar
                progressBar
                ScrollViewReader { scroll in
                    ScrollView (.horizontal, showsIndicators: false) {
                        LazyHStack {
                            Group {
                                getEmployeView(for: Employee.co1)
                                    .id(ids[0])
                                getEmployeView(for: Employee.co2)
                                    .id(ids[1])
                                getEmployeView(for: Employee.co3)
                                    .id(ids[2])
                                getEmployeView(for: Employee.co4)
                                    .id(ids[3])
                                getPrestageView(title: "Поздравляем! ты познакомился с командой", description: "Теперь расскажи о себе", imageName: "script")
                                    .id(ids[4])
                                cvView
                                    .id(ids[5])
                            }
                            .frame(width: geometry.size.width)
                        }
                        .onChange(of: progress) { newValue in
                            withAnimation {
                                scroll.scrollTo(ids[Int(newValue)], anchor: .center)
                            }
                        }
                    }
                }
                getNextButton()
            }.background(
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
    
    var titleText: String {
        switch progress {
        case 0, 1, 2, 4:
            return "Знакомство с командой"
        case 3:
            return "Знакомство с ментором"
        case 5:
            return "Анкета"
        default:
            return ""
        }
    }
    
    var navBar: some View {
        HStack {
            Image("back")
                .resizable()
                .frame(width: 22, height: 22)
                .onTapGesture {
                    progress = max(progress - 1, 0)
                }
                .opacity(progress != 0 ? 1 : 0)
                .animation(.linear(duration: 0.2))
            Spacer()
            Text(titleText)
                .font(.system(size: 18, weight: .medium, design: .rounded))
                .foregroundColor(AppColors.purple02)
            Spacer()
            Image("x")
                .resizable()
                .frame(width: 22, height: 22)
                .onTapGesture {
                    isPresented = false
                }
        }
        .padding()
    }
    
    var progressBar: some View {
        GeometryReader { reader in
            ZStack (alignment: .leading){
                RoundedRectangle(cornerRadius: 4)
                    .frame(height: 4)
                
                RoundedRectangle(cornerRadius: 4)
                    .foregroundColor(AppColors.orange)
                    .frame(width: reader.size.width * ((progress + 1) / stepsNumber),height: 4)
            }
        }
        .frame(height: 4)
    }
    
    @ViewBuilder
    func getNextButton() -> some View {
        if (0.0...3.0).contains(progress) {
            Image("next")
                .padding()
                .background(AppColors.purple1)
                .cornerRadius(12)
                .contentShape(Rectangle())
                .onTapGesture {
                    progress = min(progress + 1, stepsNumber)
                }
        } else if progress == 4.0 {
            Button("Заполнить анкету") {
                progress = min(progress + 1, stepsNumber)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .contentShape(Rectangle())
            .padding()
            .background(AppColors.purple1)
            .cornerRadius(12)
            .foregroundColor(.white)
            .font(.system(size: 18, weight: .medium, design: .rounded))
            .padding()
        } else {
            Button("Сохранить") {
                env.user.firstName = firstName
                env.user.lastName = lastName
                env.user.occupation = occupation
                env.user.hobbies = hobbie
                env.user.phone = phone
                env.user.telegram = telegram
                env.user.ices += 20
                isPresented = false
                env.shouldShowCongrats = true
                env.roadMapState.completeCurrentRoadItem()
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
    
    @ViewBuilder
    func getEmployeView(for employee: Employee) -> some View {
        ScrollView {
            VStack (alignment: .leading) {
                if #available(iOS 15.0, *) {
                    Image(employee.imageName)
                        .resizable()
                        .cornerRadius(8)
                        .overlay {
                            ZStack {
                                LinearGradient(colors: [.clear, AppColors.gray01.opacity(0.4)], startPoint: .center, endPoint: .bottom)
                                    .cornerRadius(12)
                                VStack (alignment: .leading, spacing: 4){
                                    Spacer()
                                    if employee.id == 4 {
                                    Text("Ментор")
                                        .font(.system(size: 15, weight: .medium, design: .rounded))
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 6)
                                        .background(AppColors.orange)
                                        .cornerRadius(20)
                                    }
                                    HStack {Text(employee.name)
                                        .font(.system(size: 32, weight: .semibold, design: .rounded))
                                        .foregroundColor(AppColors.purple02)
                                        Spacer()
                                    }
                                    Text(employee.occupation)
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
                
                Text("Обязанности:")
                    .padding(.horizontal)
                    .padding(.top, 16)
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                    .foregroundColor(AppColors.gray01)
                Text(employee.tasks)
                    .padding(.horizontal)
                    .padding(.top, 1)
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                    .foregroundColor(AppColors.purple02)
                
                Text("Хобби:")
                    .padding(.horizontal)
                    .padding(.top, 8)
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                    .foregroundColor(AppColors.gray01)
                
                Text(employee.hobbies)
                    .padding(.horizontal)
                    .padding(.top, 1)
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                    .foregroundColor(AppColors.purple02)
                Text("Контакты:")
                    .padding(.horizontal)
                    .padding(.top, 8)
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                    .foregroundColor(AppColors.gray01)
                
                HStack {
                    Text("Телефон: ")
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
    
    var cvView: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                Image("avatar")
                Input(text: $lastName, placeholder: "Фамилия")
                Input(text: $firstName, placeholder: "Имя")
                Input(text: $occupation, placeholder: "Должность")
                Input(text: $hobbie, placeholder: "Хобби")
                HStack (spacing: 20) {
                    Input(text: .constant("+375"), placeholder: "")
                        .frame(width: 70)
                        .disabled(true)
                    Input(text: $phone, placeholder: "(__) ___-__-__")
                }
                Input(text: $telegram, placeholder: "Telegram, @user_name")
            }
        }
        .padding(.top, 20)
        .padding(.horizontal)
        .padding(.bottom)
    }
    
    @ViewBuilder
    func getPrestageView(title: String, description: String, imageName: String) -> some View {
        VStack {
            Image(imageName)
            Text(title)
                .font(.system(size: 32, weight: .semibold, design: .rounded))
                .padding(.bottom, 16)
                .multilineTextAlignment(.center)
            Text(description)
                .font(.system(size: 18, weight: .medium, design: .rounded))
                .multilineTextAlignment(.center)
            Spacer()
        }
    }
}

struct StagesView_Previews: PreviewProvider {
    static var previews: some View {
        StagesView(isPresented: .constant(true))
            .environmentObject(Env())
    }
}
