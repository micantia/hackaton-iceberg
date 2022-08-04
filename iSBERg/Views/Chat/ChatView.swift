//
//  ChatView.swift
//  iSBERg
//
//  Created by Alexandr Nesterenko on 24.07.22.
//

import SwiftUI

enum MessageType {
    case yours
    case bot
    case botAction
}

struct Message: Identifiable {
    let id: Int
    let text: String
    let author: String
    let time: String
    let type: MessageType
    
    static var messages: [Message] {
        [
            .init(
                id: 1,
                text: "Привет,Михаил!\nЯ - виртуальный помощник Rookie.\n\nВыбери ниже вопрос, с которым я могу помочь:",
                author: "Rookie",
                time: "09:41",
                type: .bot
            ),
            .init(
                id: 2,text: "Техника (поломки и выдача новой техники)", author: "Rookie", time: "", type: .botAction),
            .init(
                id: 3,text: "Карта офиса", author: "Rookie", time: "", type: .botAction),
            .init(
                id: 4,text: "Бронирование рабочих мест", author: "Rookie", time: "", type: .botAction),
            .init(
                id: 5,text: "Канцелярия", author: "Rookie", time: "", type: .botAction),
            .init(
                id: 6,text: "Где пообедать", author: "Rookie", time: "", type: .botAction),
            .init(
                id: 7,text: "HR-вопросы, отпуска, заявления", author: "Rookie", time: "", type: .botAction),
            .init(
                id: 8,text: "Английский и обучение", author: "Rookie", time: "", type: .botAction),
            .init(
                id: 9,text: "Безопасность и доступы", author: "", time: "", type: .botAction),
            .init(
                id: 10,text: "Где пообедать", author: "", time: "", type: .yours),
            .init(
                id: 11,text: "Рядом с нашим офисом есть несколько хороших заведений с обеденным меню. Вот ссылки на их сайты и Instagram. Выбирай: \n1. https://berezkacafe.by\n2.https://cafeskif.by\n3. https://www.instagram.com/bistro.mood.indigo/ \n4. https://www.instagram.com/wine_sea_food/ \n5. https://www.pizzatempo.by", author: "Rookie", time: "09:42", type: .bot)
        ]
    }
}

struct ChatView: View {
    var body: some View {
        VStack {
            Text("Чат")
                .foregroundColor(AppColors.purple02)
                .font(.system(size: 18, weight: .medium, design: .rounded))
                .padding()
            ScrollView {
                LazyVStack {
                    ScrollViewReader { scroll in
                        ForEach(Message.messages) { message in
                            VStack {
                                HStack {
                                    if message.type == .yours {
                                        Spacer()
                                    }
                                    Text(message.text)
                                        .foregroundColor(colorForType(type: message.type))
                                        .padding()
                                        .background(bgForType(type: message.type))
                                        .cornerRadius(12)
//                                        .id(message.id)
                                    
                                    if message.type != .yours {
                                        Spacer()
                                    }
                                }
                            }
                        }
                        .onAppear {
                            scroll.scrollTo(Message.messages.last!.id, anchor: .bottom)
                        }
                    }
                }
                .padding()
            }
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
    
    @ViewBuilder
    func bgForType(type: MessageType) -> some View {
        switch type {
        case .yours:
            AppColors.purple1
        case .bot:
            AppColors.darkViolet
        case .botAction:
            AppColors.purple02
        }
    }
    
    func colorForType(type: MessageType) -> Color {
        switch type {
        case .yours:
            return Color.white
        case .bot:
            return AppColors.purple02
        case .botAction:
            return AppColors.purple1
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
