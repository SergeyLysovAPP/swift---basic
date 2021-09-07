import UIKit
import Foundation

/* Задание 1 - решите квадратное уравнение
ax2 + bx + x = 0 */

let a = 10.0
let b = 4.0
let c = 2.0

var x1: Double? = nil //первый корень
var x2: Double? = nil //второй корень

var D = pow(b, 2) - 4 * (a * c) //Вычисляем дискриминант

if D > 0 {
    x1 = (-b + sqrt(D))/(2 * a)
    x2 = (-b - sqrt(D))/(2 * a)
} else if D == 0 {
    x1 = -b / (2 * a)
    x2 = nil
} else {
    x1 = nil
    x2 = nil
}


/*  Задание 2 - Расчёт треугольника
 Даны катеты.
 Найти гиппотенузу, периметр, площадь  */

let catetOne = 1.0
let catetTwo = 2.0

var hypotenuse = sqrt(pow(catetOne, 2) + pow(catetTwo, 2))
print("Гиппотенуза треугольника = \(hypotenuse)")

var perimeter = catetOne + catetTwo + hypotenuse
print("Периметр треугольника = \(perimeter)")

var square = 0.5 * catetOne * catetTwo * sin(catetOne / hypotenuse)
print("Площадь треугольника = \(square)")


/*  Задание 3 - Расчёт банковского вклада
 Пользователь вводит сумму и годовой процент.
 Найти сумму вклада через 5 лет  */

let years = 5

print("Введите сумму вклада")
var moneySum = 10000.0    //в консольном приложении можно получить данные через readline()

print("Введите процент вклада")
var percent = 10.0
percent = percent / 100

for i in 1...years {
    moneySum = moneySum + (moneySum * percent)
}
print("Сумма вклада за 10 лет будет - \(moneySum) рублей")

