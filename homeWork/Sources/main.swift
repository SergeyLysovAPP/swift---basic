//
//  main.swift
//  HW SwiftBasic
//
//  Created by Сергей Лысов on 07.09.2021.
//

import Foundation

/*
1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?
 Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций.
 Вызовите их и обработайте результат вызова при помощи конструкции try/catch. */

//MARK: Класс и Guard/let

class DenisVilleneuve {
    
    private var ratingList = [
        "Дюна" : 7.99,
        "Бегущий по лезвию 2049" : 7.63,
        "Прибытие" : 7.52,
        "Убийца" : 7.14,
        "Враг" : 6.63,
        "Пленницы" : 7.75
    ]
    
    func findRating(title: String) -> Double? {
        return ratingList[title]
    }
    
    func averageRating() -> Double? {
        
        guard ratingList.count > 1 else {
            return nil
        }
        
        var totalRating = 0.0
        let ratingArray = Array(ratingList.values)
        
        for index in 0...ratingArray.count - 1 {
            totalRating += ratingArray[index]
        }
        
        return totalRating / Double(ratingArray.count)
    }
}

//MARK: Вызов экземпляра

let testOne = DenisVilleneuve()

print("Рейтинг фильма - \(String(describing: testOne.findRating(title: "Терминатор")))")
print("Средний рейтинг - \(String(describing: testOne.averageRating())) \n")


//MARK: Класс с try/catch

enum BankAccountError: Error {

    case insufficientFunds
    case unknownError
}

class BankAccount {
    
    init(totalMoney: Int) {
        self .totalMoney = totalMoney
    }
    
    var totalMoney: Int = 0
    
    func withdrawCash(amountCash: Int) throws {
        
        if totalMoney - amountCash < 0 {
            throw BankAccountError.insufficientFunds
            
        } else {
            
            totalMoney -= amountCash
            print("Со счёта снято \(amountCash) рублей")
        }
    }
}

//MARK: Вызов экземпляра, обработка ошибок

let accountOne = BankAccount(totalMoney: 100_000)

do {
    
    try accountOne.withdrawCash(amountCash: 500)
    print("Остаток на счёте - \(accountOne.totalMoney) рублей \n")
    
} catch BankAccountError.insufficientFunds{
    print("На счёте недостаточно денег")
}
