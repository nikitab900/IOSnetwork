//
//  Delegate.swift
//  lesson_1
//
//  Created by Никита Абакумов on 26.12.2021.
//

import Foundation

//Протокол делегирования
protocol SomeDelegateProtocol {
    func doSomethink(text: String)
}

//Класс делегатор
class SomeDelegator {
    init(){}
    
    var delegate: SomeDelegateProtocol?
    
    func delegateSomethink() {
        guard let _delegate = delegate else {return}
        _delegate.doSomethink(text: "I did it")
    }
}
