//
//  main.swift
//  HW SwiftBasic
//
//  Created by Сергей Лысов on 07.09.2021.
//

import Foundation

/*
 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
 
 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем:
 открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать
 следует только те действия, реализация которых общая для всех автомобилей).

 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.

 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.

 5. Создать несколько объектов каждого класса. Применить к ним различные действия.

 6. Вывести сами объекты в консоль. */

//MARK: Перечисления

enum EngineStatus: String {
     case online = "запущен"
     case offline = "остановлен"
  }

 enum WindowsStatus: String {
     case open = "открыты"
     case close = "закрыты"
  }

//MARK: Протокол Сar

protocol CarProtocol {
    
    var brand: String { get }
    var yearOfIssue: UInt { get }
    var trunkMaxVolume: UInt { get }
    var fuelСonsumption: UInt { get }
    var fuelMaxVolume: UInt { get }
    
    var powerReserve: UInt { get }
    
    var engineStatus: EngineStatus { get set }
    var windowsStatus: WindowsStatus { get set}
    
    func printCarInfo()
}

//MARK: Расширяем протокол Car

extension CarProtocol {
    
    mutating func startEngine() {
        engineStatus = .online
        print("Двигатель \(engineStatus.rawValue)")
    }
    
    mutating func stopEngine() {
        engineStatus = .offline
        print("Двигатель \(engineStatus.rawValue)")
    }
    
    mutating func openWindows() {
        windowsStatus = .open
        print("Окна \(windowsStatus.rawValue)")
    }
    
    mutating func closeWindows() {
        windowsStatus = .close
        print("Окна \(windowsStatus.rawValue)")
    }
    
}

//MARK: Создаём класс SportCar

final class SportCar: CarProtocol {
    
    init(brand: String, yearOfIssue: UInt, trunkMaxVolume: UInt, fuelСonsumption: UInt, fuelMaxVolume: UInt,
         engineStatus: EngineStatus, windowsStatus: WindowsStatus, enginePower: UInt, speedLimit: UInt,
         accelerationTime: UInt, transmissionType: TransmissionType, airSyspensionStatus: AirSuspensionStatus) {
        
        self.brand = brand
        self.yearOfIssue = yearOfIssue
        self.trunkMaxVolume = trunkMaxVolume
        self.fuelСonsumption = fuelСonsumption
        self.fuelMaxVolume = fuelMaxVolume
        self.engineStatus = engineStatus
        self.windowsStatus = windowsStatus
        
        self.enginePower = enginePower
        self.speedLimit = speedLimit
        self.accelerationTime = accelerationTime
        self.transmissionType = transmissionType
        self.airSyspensionStatus = airSyspensionStatus
    }
    
    // Свойства и методы, имплементированные протоколом
    
    var brand: String
    var yearOfIssue: UInt
    var trunkMaxVolume: UInt
    var fuelСonsumption: UInt
    var fuelMaxVolume: UInt
    
    var powerReserve: UInt {
        return fuelСonsumption * fuelMaxVolume
    }
    
    var engineStatus: EngineStatus
    var windowsStatus: WindowsStatus
    
    func printCarInfo() {
        
        print("""
        Спорткар
        
        Марка автомобиля - \(brand)
        Год выпуска - \(yearOfIssue) г
        
        Максимальная загрузка - \(trunkMaxVolume) кг
        Мощность двигателя - \(enginePower) лс
        Максимальная скорость - \(speedLimit) км/ч
        Время разгона до 100 км/ч - \(accelerationTime) с
        
        Расход топлива - \(fuelСonsumption) л/100 км
        Объем бака - \(fuelMaxVolume) л
        Запас хода - \(powerReserve) км
        
        Тип КП - \(transmissionType.rawValue)
        Двигатель - \(engineStatus.rawValue)
        Подвеска - \(airSyspensionStatus.rawValue)
        Окна - \(windowsStatus.rawValue) \n\n
        """)
    }
    
    
    // Индивидуальные свойства и методы класса
    
    let enginePower: UInt
    let speedLimit: UInt
    let accelerationTime: UInt
    
    var transmissionType: TransmissionType
    var airSyspensionStatus: AirSuspensionStatus
    
    enum TransmissionType: String {
        case auto = "автоматическая"
        case manual = "ручная"
    }
    
    enum AirSuspensionStatus: String {
        case online = "поднята"
        case offline = "опущена"
    }
    
    func airSuspensionTurnOn() {
        airSyspensionStatus = .online
        print("Подвеска - \(SportCar.AirSuspensionStatus.RawValue())")
    }
    
    func airSuspensionTurnOff() {
        airSyspensionStatus = .offline
        print("Подвеска - \(SportCar.AirSuspensionStatus.RawValue())")
    }
}


//MARK: Вывод экземпляра SportCar

var sportCarOne = SportCar(brand: "Porsche", yearOfIssue: 2019, trunkMaxVolume: 135, fuelСonsumption: 6,
                           fuelMaxVolume: 64, engineStatus: .offline, windowsStatus: .close, enginePower: 560,
                           speedLimit: 318, accelerationTime: 3, transmissionType: .auto, airSyspensionStatus: .offline)
sportCarOne.printCarInfo()


//MARK: Создаём класс TrunkCar

final class TrunkCar: CarProtocol {
    
    init(brand: String, yearOfIssue: UInt, trunkMaxVolume: UInt, fuelСonsumption: UInt, fuelMaxVolume: UInt,
         engineStatus: EngineStatus, windowsStatus: WindowsStatus, minOperatingTemperature: Int,
         maxOperatingTemperature: Int, turningRadius: Float, engineType: EngineType,
         fourWheelDriveStatus: FourWheelDriveStatus) {
        
        self.brand = brand
        self.yearOfIssue = yearOfIssue
        self.trunkMaxVolume = trunkMaxVolume
        self.fuelСonsumption = fuelСonsumption
        self.fuelMaxVolume = fuelMaxVolume
        self.engineStatus = engineStatus
        self.windowsStatus = windowsStatus
        
        self.minOperatingTemperature = minOperatingTemperature
        self.maxOperatingTemperature = maxOperatingTemperature
        self.turningRadius = turningRadius
        self.engineType = engineType
        self.fourWheelDriveStatus = fourWheelDriveStatus
    }
    
    // Cвойства и методы, имплементированные протоколом
    
    var brand: String
    var yearOfIssue: UInt
    var trunkMaxVolume: UInt
    var fuelСonsumption: UInt
    var fuelMaxVolume: UInt
    
    var powerReserve: UInt {
        return fuelСonsumption * fuelMaxVolume
    }
    
    var engineStatus: EngineStatus
    var windowsStatus: WindowsStatus
    
    func printCarInfo() {
        print("""
            Грузовик
            
            Марка автомобиля - \(brand)
            Год выпуска - \(yearOfIssue) г
            
            Максимальная загрузка - \(trunkMaxVolume) кг
            Температура эксплуатации - от \(minOperatingTemperature) до \(maxOperatingTemperature) гр
            Радиус поворота - \(turningRadius) м
            Тип двигателя - \(engineType.rawValue)
            
            Расход топлива - \(fuelСonsumption) л/100 км
            Объем бака - \(fuelMaxVolume) л
            Запас хода - \(powerReserve) км
            
            Двигатель - \(engineStatus.rawValue)
            Полный привод - \(fourWheelDriveStatus.rawValue)
            Окна - \(windowsStatus.rawValue) \n\n
            """)
    }
    
    // Индивидуальные свойства и методы класса
    
    let minOperatingTemperature: Int
    let maxOperatingTemperature: Int
    let turningRadius: Float
    
    let engineType: EngineType
    var fourWheelDriveStatus: FourWheelDriveStatus
    
    enum EngineType: String {
        case disel = "дизельный"
        case hybrid = "гибридный"
    }
    
    enum FourWheelDriveStatus: String {
        case online = "включен"
        case offline = "выключен"
    }
    
    func fourWheelDriveTurnOn() {
        fourWheelDriveStatus = .online
        print("Полный привод - \(fourWheelDriveStatus.rawValue)")
    }
    
    func fourWheelDriveTurnOff() {
        fourWheelDriveStatus = .offline
        print("Полный привод - \(fourWheelDriveStatus.rawValue)")
    }
}


//MARK: Вывод экземпляра TrunkCar

var trunkCarOne = TrunkCar(brand: "БелАз", yearOfIssue: 2013, trunkMaxVolume: 450_000, fuelСonsumption: 1_300,
                           fuelMaxVolume: 5_600, engineStatus: .offline, windowsStatus: .close,
                           minOperatingTemperature: -50, maxOperatingTemperature: 50, turningRadius: 19.8,
                           engineType: .hybrid, fourWheelDriveStatus: .offline)
trunkCarOne.printCarInfo()


//MARK: Добавим протокол CustomStringConvertible

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Класс SporCar расширен протоколом CustomStringConvertible"
    }
}

print(sportCarOne)

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Класс TrunkCar расширен протоколом CustomStringConvertible \n"
    }
}

print(trunkCarOne)
