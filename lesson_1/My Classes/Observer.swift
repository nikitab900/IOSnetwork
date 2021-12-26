//
//  Observer.swift
//  lesson_1
//
//  Created by Никита Абакумов on 24.12.2021.
//

import Foundation

//протокол для реализации подписчиками
protocol SubscriberProtocol: AnyObject {
    func update(sub: Notificator) -> String
}

class Notificator {
    private init(){}
    static var shared = Notificator()
    
    //Массив подписчиков на событие
    private var subscribers: [SubscriberProtocol] = []
    
    //Метод добавления подписчика
    func subscribe(newSubscriber: SubscriberProtocol) {
        subscribers.append(newSubscriber)
    }
    
    //Метод удаления подписчика
    func unSubscribe(deleteSubscriber: SubscriberProtocol) {
        subscribers.removeAll(where: {$0 === deleteSubscriber})
    }
    
    //вызываем метод update из протокола SubscriberProtocol у каждого подписанного побъекта
    func notify() {
        subscribers.forEach {
            $0.update(sub: self)
        }
    }
}

class SomeSubscriber: SubscriberProtocol {
    init(name: String) {
        self.name = name
    }
    
    let name: String
    var newInfoCounter = 0
    
    func update(sub: Notificator) -> String {
        newInfoCounter += 1
        return "\(name) get new info!"
        //print("\(name) get new info!")
    }
}
