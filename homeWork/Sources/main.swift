//
//  main.swift
//  HW SwiftBasic
//
//  Created by Сергей Лысов on 07.09.2021.
//

import Foundation

let randomUInt = UInt.random(in: 1...100)
print("Число для проверки: \(randomUInt) \n")



//MARK: Задание 1
//Написать функцию, которая определяет, четное число или нет.

func isEven(numForCheck: UInt) -> Bool {
    
    if numForCheck % 2 == 0 {
        return true
    }
    
    return false
}

print("Число \(randomUInt) - \(isEven(numForCheck: randomUInt) ? "чётное" : "нечётное")")



//MARK: Задание 2
//Написать функцию, которая определяет, делится ли число без остатка на 3.

func isDivBy3(numForCheck: UInt) -> Bool {
    
    if numForCheck % 3 == 0 {
        return true
    }
    
    return false
}

print("Число \(randomUInt) - \(isDivBy3(numForCheck: randomUInt) ? "делится на 3" : "не делится на 3") \n")



//MARK: Задание 3
//Создать возрастающий массив из 100 чисел.

func incArray(amount: UInt, startValue: UInt) -> [UInt] {
    
    var resultArray: [UInt] = []
    
    for i in startValue ..< startValue + amount {
        resultArray.append(i)
    }
    
    return resultArray
}

var unsortedArray = incArray(amount: 5, startValue: randomUInt)

print("""
    Сгенерирован массив из \(unsortedArray.count) элементов
    Начальное значение: \(randomUInt)
    Значения в массиве: \(unsortedArray) \n
    """)



//MARK: Задание 4
//Удалить из массива выше четные числа и числа, которые не делятся на 3.

var index = 0

while index < unsortedArray.count {
    
    if isEven(numForCheck: unsortedArray[index]) || !isDivBy3(numForCheck: unsortedArray[index]) {
        
        print("Удалили число: \(unsortedArray[index])")
        unsortedArray.remove(at: index)
        index -= 1
        
    }
    
    index += 1
    
}

print("""
    \nТеперь массив состоит из \(unsortedArray.count) элементов
    Значения в массиве: \(unsortedArray) \n
    """)



//MARK: Задание 5
//Написать функцию, которая добавляет в массив новое число Фибоначчи.
//Добавить при помощи функции 50 элементов.

func generateFibo(firstNumber: Int, secondNumber: Int, amount: Int) -> [Int] {
    
    var arrayFibo = [firstNumber, secondNumber]
    var index = arrayFibo.count
    
    for _ in 1...amount - arrayFibo.count {
        arrayFibo.append(arrayFibo[index - 2] + arrayFibo[index - 1])
        index += 1
    }
    
    print("Cгенерирован ряд из \(amount) чисел:")
    return arrayFibo
    
}

print("""
        \(generateFibo(firstNumber: Int.random(in: 1...10),
                       secondNumber: Int.random(in: 1...10),
                       amount: 10)) \n
        """)
