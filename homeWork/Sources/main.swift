//
//  main.swift
//  HW SwiftBasic
//
//  Created by Сергей Лысов on 07.09.2021.
//

import Foundation

/*
 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
 3. Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.*/


//MARK: структура Queue

struct Queue<T: Comparable> {
    
    private var queueArray: [T] = []
    
    mutating func push(_ element: T) {
        
        queueArray.insert(element, at: 0)
        print("Добавлено число - \(element)")
    }
    
    mutating func pop() {
        queueArray.isEmpty ? print("Очередь пустая \n") : print("Удалено число - \(queueArray.removeLast())")
    }
    
//MARK: Сабскрипт

    subscript (subscriptIndex: Int) -> T? {
        
        var subscriptResult: T?
        
        queueArray.count - 1 > subscriptIndex ? subscriptResult = queueArray[subscriptIndex] : (subscriptResult = nil)
        return subscriptResult
    }
}


//MARK: Расширение Queue

extension Queue {
    
    mutating func sortQueue() {
        queueArray.sort()
    }
}


//MARK: Экземпляр структуры

var firstQueue = Queue<Int>()
let quantityQueue = Int.random(in: 1...10)

for _ in 1...quantityQueue {
    firstQueue.push(Int.random(in: 1...10))
}

print("\nСгенерирована очередь: \(firstQueue) \n")

firstQueue.sortQueue()
print("Очередь отсортирована: \(firstQueue) \n")

for _ in 1...quantityQueue {
    
    firstQueue.pop()
    print("\(firstQueue) \n")
}
