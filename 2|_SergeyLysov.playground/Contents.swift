import UIKit
import Foundation

/* Задание 1.
Написать функцию, которая определяет, четное число или нет */

var random = Int(arc4random_uniform(100))

func checkParity (number: Int) -> Bool {
    var result = false
    if (number % 2 == 0) {
        result = true
    }
    return result
}
checkParity(number: random)


/* Задание 2.
 Написать функцию, которая определяет, делится ли число без остатка на 3 */

func divByThree (number: Int) -> Bool {
    var result = false
    if (number % 3 == 0) {
        result = true
    }
    return result
}
divByThree(number: random)


/* Задание 3.
 Создать возрастающий массив из 100 чисел */

func fillArray (amount: Int) -> [Int] {
    var resultArray: [Int] = []
    for i in 1...amount {
        resultArray.append(i)
    }
    
    return resultArray
}

var nonSortedArray: [Int] = fillArray(amount: 100)
nonSortedArray

/* Задание 4.
 Удалить из этого массива все четные числа и все числа, которые не делятся на 3 */

var index = 0

while nonSortedArray.count > 0 && index < nonSortedArray.count {
    if (nonSortedArray[index] % 2 == 0) || (nonSortedArray[index] % 3 != 0) {
        nonSortedArray.remove(at: index)
        index -= 1
    }
    index += 1
}
print("Отсортированный массив - \(nonSortedArray)")

/*Задание 5.
 Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов*/
 
var originArray: [Int] = [1, 2]

func generateFibonacci (array: [Int], amount: Int) -> [Int] {
    var arrayFibonacci = array
    var index = array.count - 1
    
    if array.count < 2 {
        print("Для генерации нужно два числа")
    } else {
        for i in 1...amount {
            arrayFibonacci.append(arrayFibonacci[index] + arrayFibonacci[index - 1])
            index += 1
        }
    }
    return arrayFibonacci
}

print("Последовательность Фибоначчи -  \(generateFibonacci(array: originArray, amount: 12))")


