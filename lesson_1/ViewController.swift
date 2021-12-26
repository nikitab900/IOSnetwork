//
//  ViewController.swift
//  lesson_1
//
//  Created by Никита Абакумов on 24.12.2021.
//

import UIKit

class ViewController: UIViewController, SomeDelegateProtocol{
    
    //Метод делегирования
    func doSomethink(text: String) {
        delegateResultLabel.text = text
    }
    
    //MARK: Observer
    let someSubscriber1 = SomeSubscriber(name: "SomeName 1")
    let someSubscriber2 = SomeSubscriber(name: "SomeName 2")
    let someSubscriber3 = SomeSubscriber(name: "SomeName 3")
    
    //MARK: Delegate
    let someDelegator = SomeDelegator()
    
    @IBOutlet weak var singletonResultLabel: UILabel!
    @IBOutlet weak var observerResultLabel: UILabel!
    @IBOutlet weak var delegateResultLabel: UILabel!
    
    @IBAction func delegateButton() {
        someDelegator.delegateSomethink()
    }
    
    @IBAction func notifyButton() {
        Notificator.shared.notify()
        
        let observerResult = """
                             Observer
                             Some Subscriber 1 -> \(someSubscriber1.newInfoCounter)
                             Some Subscriber 2 -> \(someSubscriber2.newInfoCounter)
                             Some Subscriber 3 -> \(someSubscriber3.newInfoCounter)
                             """
        
        observerResultLabel.text = observerResult
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Singleton
        let singleTonInstanse1 = Singleton.shared
        let singleTonInstanse2 = Singleton.shared
        let singleTonInstanse3 = Singleton.shared
        let singleTonInstanse4 = Singleton.shared
        
        let singletonResult = """
                              Singleton
                              Instanse 1 id -> \(singleTonInstanse1.id!)
                              Instanse 2 id -> \(singleTonInstanse2.id!)
                              Instanse 3 id -> \(singleTonInstanse3.id!)
                              Instanse 4 id -> \(singleTonInstanse4.id!)
                              """
        
        singletonResultLabel.text = singletonResult
        //Просто показал что конструктур вызывается только один раз
        
        
        //Observer
        Notificator.shared.subscribe(newSubscriber: someSubscriber1)
        Notificator.shared.subscribe(newSubscriber: someSubscriber2)
        Notificator.shared.subscribe(newSubscriber: someSubscriber3)
        Notificator.shared.unSubscribe(deleteSubscriber: someSubscriber2)
        
        //Delegate
        someDelegator.delegate = self
    }
}

