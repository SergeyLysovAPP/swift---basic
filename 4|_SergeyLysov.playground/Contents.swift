import Foundation

enum EngineStatus: String {
    case online = "запущен"
    case offline = "остановлен"
 }

enum WindowStatus: String {
    case open = "открыты"
    case close = "закрыты"
 }

class Car {
    var model: String
    var yearOfIssue: UInt
    var trunkMaxVolume: UInt
    var numberOfDoors = 4

    var engineStatus: EngineStatus
    var windowStatus: WindowStatus

    init(model: String, yearOfIssue: UInt, trunkMaxVolume: UInt, engineStatus: EngineStatus, windowStatus: WindowStatus) {
        self.model = model
        self.yearOfIssue = yearOfIssue
        self.trunkMaxVolume = trunkMaxVolume
        self.engineStatus = engineStatus
        self.windowStatus = windowStatus
    }
    
    func startEngine() {
        engineStatus = .online
    }
    func stopEngine() {
        engineStatus = .offline
    }
    func openWindows() {
        windowStatus = .open
    }
    func closeWindows() {
        windowStatus = .close
    }
}


enum SpoilerStatus: String {
    case online = "поднят"
    case offline = "опущен"
}

class SportCar: Car {
    var isSppoler: SpoilerStatus
    var clearance: UInt
    
    init(model: String, yearOfIssue: UInt, trunkMaxVolume: UInt, engineStatus: EngineStatus, windowStatus: WindowStatus, isSppoler: SpoilerStatus, clearance: UInt, numberOfDoors: UInt) {
        
        self.isSppoler = isSppoler
        self.clearance = clearance
        
        super.init(model: model, yearOfIssue: yearOfIssue, trunkMaxVolume: trunkMaxVolume, engineStatus: engineStatus, windowStatus: windowStatus)
    }
    
    func raiseSpoiler() {
        isSppoler = .online
    }
    func fallSpoiler() {
        isSppoler = .offline
    }
    
    override func startEngine() {
        raiseSpoiler()
        closeWindows()
        print("Спорткарт стартует - закрываем окна и поднимаем спойлер")
    }
}


enum FullTransmissonStatus: String {
    case online = "полный привод включен"
    case offline = "полный привод выключен"
}

class TrunkCar: Car{
    var isFullTransmission: FullTransmissonStatus
    
    init(model: String, yearOfIssue: UInt, trunkMaxVolume: UInt, engineStatus: EngineStatus, windowStatus: WindowStatus, isFullTransmission: FullTransmissonStatus, numberOfDoors: UInt) {
        self.isFullTransmission = isFullTransmission
        
        super.init(model: model, yearOfIssue: yearOfIssue, trunkMaxVolume: trunkMaxVolume, engineStatus: engineStatus, windowStatus: windowStatus)
    }
    func onFullTransmission() {
        isFullTransmission = .online
    }
    func offFullTransmission() {
        isFullTransmission = .offline
    }
    
    override func startEngine() {
        onFullTransmission()
        closeWindows()
        print("Грузовик стартует - закрываем окна и включаем полный привод")
    }
}


var porsche = SportCar(model: "Porsche 911", yearOfIssue: 2016, trunkMaxVolume: 400, engineStatus: .offline, windowStatus: .open, isSppoler: .offline, clearance: 120, numberOfDoors: 2)

print("""

    Марка автомобиля - \(porsche.model)
    Год выпуска - \(porsche.yearOfIssue) год
    Дорожный просвет - \(porsche.clearance) мм
    Количество дверей - \(porsche.numberOfDoors) шт
    Максимальная загрузка - \(porsche.trunkMaxVolume) кг
    Двигатель - \(porsche.engineStatus.rawValue)
    Окна - \(porsche.windowStatus.rawValue)
    Спойлер - \(porsche.isSppoler.rawValue)

""")
porsche.startEngine()

var zil = TrunkCar(model: "ЗИЛ-43276т", yearOfIssue: 2016, trunkMaxVolume: 8000, engineStatus: .offline, windowStatus: .close, isFullTransmission: .offline, numberOfDoors: 4)

print("""

    Марка автомобиля - \(zil.model)
    Год выпуска - \(zil.yearOfIssue) год
    Количество дверей - \(zil.numberOfDoors) шт
    Максимальная загрузка - \(zil.trunkMaxVolume) кг
    Двигатель - \(zil.engineStatus.rawValue)
    Окна - \(zil.windowStatus.rawValue)
    Полный привод - \(zil.isFullTransmission.rawValue)

""")
zil.startEngine()
