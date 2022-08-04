//
//  StageItem.swift
//  iSBERg
//
//  Created by Alexandr Nesterenko on 24.07.22.
//

import Foundation


struct Employee: Identifiable {
    let id: Int
    let imageName: String
    let name: String
    let occupation: String
    let tasks: String
    let hobbies: String
    
    static var co1: Employee {
        .init(
            id: 1,
            imageName: "co1",
            name: "Великолепный Игорь",
            occupation: "Тим лид",
            tasks: "Общается с клиентами или бизнес-подразделениями компании. Оценивает задачи, сроки каждого этапа, разбивает их на спринты. Распределяет нагрузку между разработчиками.",
            hobbies: "Мода и стиль"
        )
    }
    
    static var co2: Employee {
        .init(
            id: 2,
            imageName: "co2",
            name: "Веселый Андрей",
            occupation: "Владелец продукта",
            tasks: "Отвечает за максимизацию ценности продукта, получаемого в результате работы Скрам-команды. В его обязанности также входит курирование и приоритизация Бэклога Продукта.",
            hobbies: "Пабы и футбол. Обожаю вкусно покушать"
        )
    }
    static var co3: Employee {
        .init(
            id: 3,
            imageName: "co3",
            name: "Красивая Марина",
            occupation: "Дизайнер",
            tasks: "Ведущий UI/UX дизайнер создаёт и дорабатывает интерфейсы мобильных приложений и/или игр, проектирует пользовательские сценарии",
            hobbies: "Люблю котиков, мобильную фотографию. Предпочитаю слушать громко музыку под вино"
        )
    }
    static var co4: Employee {
        .init(
            id: 4,
            imageName: "co4",
            name: "Солнцева Диана",
            occupation: "Frontend разработчик",
            tasks: "Твой верный помощник во время периода адаптации. Расскажет про взаимодействия, ведение документации. Ментор свяжется с тобой в ближайшее время.",
            hobbies: "Мода и стиль"
        )
    }
    
    
    static var employees: [Employee] {
        [
            co1, co2, co3, co4
        ]
    }
}
