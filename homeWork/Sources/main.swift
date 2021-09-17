//
//  main.swift
//  HW SwiftBasic
//
//  Created by Сергей Лысов on 07.09.2021.
//

import Foundation

/*
 1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
 6. Вывести значения свойств экземпляров в консоль. */

//MARK: Перечисления

enum EngineStatus: String {
    case online = "запущен"
    case offline = "остановлен"
}

enum WindowsStatus: String {
    case open = "открыты"
    case closed = "закрыты"
}

struct SpotCar {
    
//MARK: Свойства
    
    let brand: String
    let yearOfIssue: UInt
    
    let fuelСonsumption: UInt
    let fuelMaxVolume: UInt
    
    var powerReserve: UInt {
        
        get {
            return fuelСonsumption * fuelMaxVolume
        }
    }
    
    var windowsStatus: WindowsStatus {
        
        willSet {
            newValue == .open ? print("Окна сейчас откроются") : print("Окна сейчас закооются")
        }
        
        didSet {
            oldValue == .open ? print("Окна закрылись") : print("Окна открылись")
        }
    }
    
    var engineStatus: EngineStatus
    
//MARK: Методы
    
    mutating func startEngine() {
        
        self.engineStatus = .online
        print("Двигатель \(engineStatus.rawValue)")
        
    }
    
    mutating func stopEngine() {
        
        self.engineStatus = .offline
        print("Двигатель \(engineStatus.rawValue)")
        
    }
    
    let trunkMaxVolume: UInt
    var trunkVolume: UInt
    
    mutating func addCargo (weight: UInt) {
        trunkVolume + weight <= trunkMaxVolume ? trunkVolume += weight : print("Груз не поместится в багажник")
    }
    
    mutating func removeCargo (weight: UInt) {
        trunkVolume != 0 ? trunkVolume -= weight : print("Багажник пустой")
    }
    
    //MARK: Конструкторы
    
    init(brand: String, yearOfIssue: UInt, trunkMaxVolume: UInt, trunkVolume: UInt, fuelСonsumption: UInt, fuelMaxVolume: UInt, engineStatus: EngineStatus, windowsStatus: WindowsStatus) {
        
        self.brand = brand
        self.yearOfIssue = yearOfIssue
        self.trunkMaxVolume = trunkMaxVolume
        self.fuelСonsumption = fuelСonsumption
        self.fuelMaxVolume = fuelMaxVolume
        self.engineStatus = engineStatus
        self.windowsStatus = windowsStatus
        self.trunkVolume = trunkVolume
        
    }
    
    func printCarInfo() {
        print("""
            Марка автомобиля - \(brand)
            Год выпуска - \(yearOfIssue) г
            
            Максимальгая загрузка - \(trunkMaxVolume) кг
            Текущая загрузка - \(trunkVolume) кг
            
            Расход топлива - \(fuelСonsumption) л/100 км
            Объем бака - \(fuelMaxVolume) л
            Запас хода - \(powerReserve) км
            
            Двигатель - \(engineStatus.rawValue)
            Окна - \(windowsStatus.rawValue) \n\n
            """)
    }
    
}

//MARK: Вызов экземпляров

var sportCarOne = SpotCar(brand: "Honda", yearOfIssue: 1992, trunkMaxVolume: 1200, trunkVolume: 50, fuelСonsumption: 2, fuelMaxVolume: 60, engineStatus: .offline, windowsStatus: .closed)

sportCarOne.printCarInfo()

var sportCarTwo = SpotCar(brand: "BMW", yearOfIssue: 2006, trunkMaxVolume: 900, trunkVolume: 30, fuelСonsumption: 3, fuelMaxVolume: 80, engineStatus: .offline, windowsStatus: .open)

sportCarTwo.printCarInfo()



//MARK: Cтруктура - TrunkCar

struct TrunkCar {
    let brand: String
    let yearOfIssue: UInt
    
    let fuelСonsumption: UInt
    let fuelMaxVolume: UInt
    
    var powerReserve: UInt {
        
        get {
            return fuelСonsumption * fuelMaxVolume
        }
    }
    
    var windowsStatus: WindowsStatus {
        
        willSet {
            newValue == .open ? print("Окна сейчас откроются") : print("Окна сейчас закооются")
        }
        
        didSet {
            oldValue == .open ? print("Окна закрылись") : print("Окна открылись")
        }
    }
    
    var engineStatus: EngineStatus
    
    mutating func startEngine() {
        
        self.engineStatus = .online
        print("Двигатель \(engineStatus.rawValue)")
        
    }
    
    mutating func stopEngine() {
        
        self.engineStatus = .offline
        print("Двигатель \(engineStatus.rawValue)")
        
    }
    
    let trunkMaxVolume: UInt
    var trunkVolume: UInt
    
    mutating func addCargo (weight: UInt) {
        trunkVolume + weight <= trunkMaxVolume ? trunkVolume += weight : print("Груз не поместится в багажник")
    }
    
    mutating func removeCargo (weight: UInt) {
        trunkVolume != 0 ? trunkVolume -= weight : print("Багажник пустой")
    }
    
    init(brand: String, yearOfIssue: UInt, trunkMaxVolume: UInt, trunkVolume: UInt, fuelСonsumption: UInt, fuelMaxVolume: UInt, engineStatus: EngineStatus, windowsStatus: WindowsStatus) {
        
        self.brand = brand
        self.yearOfIssue = yearOfIssue
        self.trunkMaxVolume = trunkMaxVolume
        self.fuelСonsumption = fuelСonsumption
        self.fuelMaxVolume = fuelMaxVolume
        self.engineStatus = engineStatus
        self.windowsStatus = windowsStatus
        self.trunkVolume = trunkVolume
        
    }
    
    func printCarInfo() {
        print("""
            Марка автомобиля - \(brand)
            Год выпуска - \(yearOfIssue) г
            
            Максимальгая загрузка - \(trunkMaxVolume) кг
            Текущая загрузка - \(trunkVolume) кг
            
            Расход топлива - \(fuelСonsumption) л/100 км
            Объем бака - \(fuelMaxVolume) л
            Запас хода - \(powerReserve) км
            
            Двигатель - \(engineStatus.rawValue)
            Окна - \(windowsStatus.rawValue) \n\n
            """)
    }
}

//MARK: Вызов экземпляра

var trunkCarOne = TrunkCar(brand: "Harvester", yearOfIssue: 2005, trunkMaxVolume: 6000, trunkVolume: 500, fuelСonsumption: 20, fuelMaxVolume: 600, engineStatus: .offline, windowsStatus: .closed)

trunkCarOne.printCarInfo()
