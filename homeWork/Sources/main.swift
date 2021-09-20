//
//  main.swift
//  HW SwiftBasic
//
//  Created by Сергей Лысов on 07.09.2021.
//

import Foundation

/*
 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
 2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
 3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 6. Вывести значения свойств экземпляров в консоль. */

//MARK: Перечисления

enum EngineStatus: String {
    case online = "запущен"
    case offline = "остановлен"
 }

enum WindowStatus: String {
    case open = "открыты"
    case close = "закрыты"
 }

//MARK: Класс Car

class Car {
    
    let brand: String
    let yearOfIssue: UInt
    let trunkMaxVolume: UInt
    
    let fuelСonsumption: UInt
    let fuelMaxVolume: UInt
    
    var powerReserve: UInt {
        return fuelСonsumption * fuelMaxVolume
    }
    
    var engineStatus: EngineStatus
    var windowsStatus: WindowStatus
    
    func startEngine() {
        
        engineStatus = .online
        print("Двигатель \(engineStatus.rawValue)")
    }
    
    func stopEngine() {
        
        engineStatus = .offline
        print("Двигатель \(engineStatus.rawValue)")
    }
    
    func openWindows() {
        
        windowsStatus = .open
        print("Окна \(windowsStatus.rawValue)")
    }
    
    func closeWindows() {
        
        windowsStatus = .close
        print("Окна \(windowsStatus.rawValue)")
    }
    
    init(brand: String, yearOfIssue: UInt, trunkMaxVolume: UInt, fuelСonsumption: UInt, fuelMaxVolume: UInt,
         engineStatus: EngineStatus, windowStatus: WindowStatus) {
        
        self.brand = brand
        self.yearOfIssue = yearOfIssue
        self.trunkMaxVolume = trunkMaxVolume
        self.fuelСonsumption = fuelСonsumption
        self.fuelMaxVolume = fuelMaxVolume
        self.engineStatus = engineStatus
        self.windowsStatus = windowStatus
    }
    
    func printCarInfo() {
             print("""
                 Марка автомобиля - \(brand)
                 Год выпуска - \(yearOfIssue) г
                 
                 Максимальная загрузка - \(trunkMaxVolume) кг
                 
                 Расход топлива - \(fuelСonsumption) л/100 км
                 Объем бака - \(fuelMaxVolume) л
                 Запас хода - \(powerReserve) км
                 
                 Двигатель - \(engineStatus.rawValue)
                 Окна - \(windowsStatus.rawValue) \n\n
                 """)
         }
}

//MARK: Наследник - SportCar

final class SportCar: Car {
    
    let enginePower: UInt
    let speedLimit: UInt
    let accelerationTime: UInt

    enum TransmissionType: String {

        case auto = "автоматическая"
        case manual = "ручная"
    }

    var transmissionType: TransmissionType

    enum AirSuspensionStatus: String {

        case online = "поднята"
        case offline = "опущена"
    }

    var airSyspensionStatus: AirSuspensionStatus

    func airSuspensionTurnOn() {

        airSyspensionStatus = .online
        print("Подвеска - \(SportCar.AirSuspensionStatus.RawValue())")
    }

    func airSuspensionTurnOff() {

        airSyspensionStatus = .offline
        print("Подвеска - \(SportCar.AirSuspensionStatus.RawValue())")
    }
    
    override func printCarInfo() {
        
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
    
    init(brand: String, yearOfIssue: UInt, trunkMaxVolume: UInt, fuelСonsumption: UInt, fuelMaxVolume: UInt,
         engineStatus: EngineStatus, windowStatus: WindowStatus, enginePower: UInt, speedLimit: UInt,
         accelerationTime: UInt, transmissionType: TransmissionType, airSyspensionStatus: AirSuspensionStatus) {
        
        self.enginePower = enginePower
        self.speedLimit = speedLimit
        self.accelerationTime = accelerationTime
        self.transmissionType = transmissionType
        self.airSyspensionStatus = airSyspensionStatus

        super.init (brand: brand, yearOfIssue: yearOfIssue, trunkMaxVolume: trunkMaxVolume,
                    fuelСonsumption: fuelСonsumption, fuelMaxVolume: fuelMaxVolume, engineStatus: engineStatus,
                    windowStatus: windowStatus)
    }
}

//MARK: Вызов экземпляра SportCar

var sportCarOne = SportCar(brand: "Porsche", yearOfIssue: 2019, trunkMaxVolume: 135, fuelСonsumption: 6,
                           fuelMaxVolume: 64, engineStatus: .offline, windowStatus: .close, enginePower: 560,
                           speedLimit: 318, accelerationTime: 3, transmissionType: .auto, airSyspensionStatus: .offline)
sportCarOne.printCarInfo()


//MARK: Наследник - TrunkCar

final class TrunkCar: Car {
    
    let minOperatingTemperature: Int
    let maxOperatingTemperature: Int
    let turningRadius: Float
    
    enum EngineType: String {

        case disel = "дизельный"
        case hybrid = "гибридный"
    }
    
    let engineType: EngineType
    
    enum FourWheelDriveStatus: String {
        case online = "включен"
        case offline = "выключен"
    }
    
    var fourWheelDriveStatus: FourWheelDriveStatus
    
    func fourWheelDriveTurnOn() {
        
        fourWheelDriveStatus = .online
        print("Полный привод - \(fourWheelDriveStatus.rawValue)")
    }
    
    func fourWheelDriveTurnOff() {
        
        fourWheelDriveStatus = .offline
        print("Полный привод - \(fourWheelDriveStatus.rawValue)")
    }
    
    override func printCarInfo() {
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
    
    init(brand: String, yearOfIssue: UInt, trunkMaxVolume: UInt, fuelСonsumption: UInt, fuelMaxVolume: UInt,
         engineStatus: EngineStatus, windowStatus: WindowStatus, minOperatingTemperature: Int,
         maxOperatingTemperature: Int, turningRadius: Float, engineType: EngineType,
         fourWheelDriveStatus: FourWheelDriveStatus) {
        
        self.minOperatingTemperature = minOperatingTemperature
        self.maxOperatingTemperature = maxOperatingTemperature
        self.turningRadius = turningRadius
        self.engineType = engineType
        self.fourWheelDriveStatus = fourWheelDriveStatus

        super.init (brand: brand, yearOfIssue: yearOfIssue, trunkMaxVolume: trunkMaxVolume,
                    fuelСonsumption: fuelСonsumption, fuelMaxVolume: fuelMaxVolume, engineStatus: engineStatus,
                    windowStatus: windowStatus)
    }
}

//MARK: Вызов экземпляра TrunkCar

var trunkCarOne = TrunkCar(brand: "БелАз", yearOfIssue: 2013, trunkMaxVolume: 450_000, fuelСonsumption: 1_300,
                           fuelMaxVolume: 5_600, engineStatus: .offline, windowStatus: .close,
                           minOperatingTemperature: -50, maxOperatingTemperature: 50, turningRadius: 19.8,
                           engineType: .hybrid, fourWheelDriveStatus: .offline)
trunkCarOne.printCarInfo()
