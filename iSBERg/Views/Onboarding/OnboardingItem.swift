//
//  OnboardingItem.swift
//  iSBERg
//
//  Created by Alexandr Nesterenko on 23.07.22.
//

import Foundation

struct OnboardingItem: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
    
    static var items: [OnboardingItem] {
        [
            OnboardingItem(
                imageName: "onboarding1",
                title: "Привет, коллега!",
                description: "Мы для тебя подготовили обучающий тур, чтобы легче было понять как здесь все устроено"
            ),
            OnboardingItem(
                imageName: "onboarding2",
                title: "Почти как игра",
                description: "Весь процесс будет представлен в легкой игровой форме"
            ),
            OnboardingItem(
                imageName: "onboarding3",
                title: "Зарабатывай льдины",
                description: "Хочешь быстрее стать частью нашей команды? Тогда Break the ice. Выполняй задания, собирай льдины, а затем менях их на крутые призы"
            ),
        ]
    }
}
