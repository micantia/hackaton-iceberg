//
//  RoadItem.swift
//  iSBERg
//
//  Created by Alexandr Nesterenko on 23.07.22.
//

import Foundation

enum RoadItemStatus {
    case active
    case completed
    case locked
}

struct RoadItem: Identifiable {
    let id: Int
    let title: String
    var subtitle: String
    let success: String
    let description: String
    let imageName: String
    var status: RoadItemStatus
    
    static var roadItems: [RoadItem] {
        [
            RoadItem(
                id: 1,
                title: "Твоя команда",
                subtitle: "Достижение не достигнуто",
                success: "Достижение: Знаком с командой",
                description: "Привет! С сегодняшнего дня ты часть нашей дружной команды. Давай знакомиться",
                imageName: "RoadItem1",
                status: .active
            ),
            RoadItem(
                id: 2,
                title: "Твой проект",
                subtitle: "Шаг не найден",
                success: "Достижение: Знаком с командой",
                description: "",
                imageName: "",
                status: .locked
            ),
            RoadItem(
                id: 3,
                title: "Гид по офису",
                subtitle: "Шаг не пройден",
                success: "Достижение: Знаком с командой",
                description: "",
                imageName: "",
                status: .locked
            ),
            RoadItem(
                id: 4,
                title: "Встреча с ментором",
                subtitle: "Шаг не пройден",
                success: "Достижение: Знаком с командой",
                description: "",
                imageName: "",
                status: .locked
            ),
            RoadItem(
                id: 5,
                title: "Тимбилдинги. Как мы отдыхаем",
                subtitle: "Шаг не пройден",
                success: "Достижение: Знаком с командой",
                description: "",
                imageName: "",
                status: .locked
            ),
            RoadItem(
                id: 6,
                title: "Поле чудес",
                subtitle: "Шаг не пройден",
                success: "Достижение: Знаком с командой",
                description: "",
                imageName: "",
                status: .locked
            ),
            RoadItem(
                id: 7,
                title: "Встреча с HR",
                subtitle: "Шаг не пройден",
                success: "Достижение: Знаком с командой",
                description: "",
                imageName: "",
                status: .locked
            ),
            RoadItem(
                id: 8,
                title: "Бенефиты",
                subtitle: "Шаг не пройден",
                success: "Достижение: Знаком с командой",
                description: "",
                imageName: "",
                status: .locked
            ),
        ]
    }
}

struct RoadMapState {
    var currentRoadItemIndex: Int
    var roadItems: [RoadItem]
    
    mutating func completeCurrentRoadItem() {
        roadItems[currentRoadItemIndex].status = .completed
        
        if currentRoadItemIndex + 1 <= roadItems.count - 1 {
            roadItems[currentRoadItemIndex + 1].status = .active
            roadItems[currentRoadItemIndex + 1].subtitle = "Достижение не достигнуто"
        }
        
        currentRoadItemIndex = min(currentRoadItemIndex + 1, roadItems.count - 1)
    }
}
