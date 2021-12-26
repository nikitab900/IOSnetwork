//
//  Singleton.swift
//  lesson_1
//
//  Created by Никита Абакумов on 24.12.2021.
//

import Foundation

class Singleton {
    private init() {
        self.id = getId()
    }
    
    static var shared = Singleton()
    var id: Int?
    
    private func getId() -> Int {
        return Int.random(in: 0...1000)
    }
    
}
