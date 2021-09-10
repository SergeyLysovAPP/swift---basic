//
//  main.swift
//  HW SwiftBasic
//
//  Created by Сергей Лысов on 07.09.2021.
//

import Foundation

// Задание 1
// Решите квадратное уравнение вида:
// a(x1)2 + b(x2) + c = 0

let a = Double.random(in: -100...100)
let b = Double.random(in: -100...100)
let c = Double.random(in: -100...100)

let dscrmnt = pow(b, 2) - (4 * a * c)

if dscrmnt > 0 {
    
    let x1 = (-b + sqrt(dscrmnt)) / (2 * a)
    let x2 = (-b - sqrt(dscrmnt)) / (2 * a)
    
    print("""
    D > 0
    Первый корень x1 = \(x1)
    Второй корень х2 = \(x2)
    
    """)
    
} else if dscrmnt < 0 {
    
    print("""
    D < 0
    Корней нет
    
    """)
    
} else {
    
    let x1 = -b / (2 * a)
    
    print("""
    D = 0
    Первый корень x1 = \(x1)
    Второго корня нет
    
    """)
}



// Задание 2
// Даны катеты прямоугольного треугольника.
// Найти площадь, периметр и гипотенузу треугольника.

let legOne = Double.random(in: 1...10)
let legTwo = Double.random(in: 1...10)

let hypo = sqrt(pow(legOne, 2) + pow(legTwo, 2))
print("Гиппотенуза треугольника = \(hypo)")

let prmtr = legOne + legTwo + hypo
print("Периметр треугольника = \(prmtr)")

let square = 0.5 * legOne * legTwo
print("Площадь треугольника = \(square)\n")



//Задание 3 - Расчёт банковского вклада
//Пользователь вводит сумму и годовой процент.
//Найти сумму вклада через 5 лет.

let years = 5

print("Введите сумму вклада")
var moneySum = 100_000.0

print("Введите процент")
let percent = 10.0

for _ in 1...years {
    moneySum = moneySum + (moneySum * (percent / 100))
}
print("Сумма денег на вкладе через \(years) лет = \(moneySum)\n")
