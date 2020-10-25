enum EngineStatus: String {
    case online = "запущен"
    case offline = "остановлен"
}

enum WindowStatus: String {
    case open = "открыты"
    case close = "закрыты"
}

struct SportCar {
    let model: String
    let yearOfIssue: UInt
    let trunkMaxVolume: UInt
    
    var trunkVolume: UInt {
        didSet {
            trunkVolume
        }
    }
    
    mutating func addCargo(weight: UInt) {
        if (trunkVolume + weight) < trunkMaxVolume {
            trunkVolume += weight
        } else {
            print("Груз не поместится в багажник")
        }
    }
    
    mutating func removeCargo(weight: UInt) {
        if trunkVolume != 0 {
            trunkVolume -= weight
        } else {
            print("Багажник пустой")
        }
    }
    
    var engineStatus: EngineStatus
    var windowStatus: WindowStatus
    
    mutating func startEngine() {
        self.engineStatus = .online
    }
    mutating func stopEngine() {
        self.engineStatus = .offline
    }
    
    init() {
        model = "Honda"
        yearOfIssue = 1992
        trunkMaxVolume = 2500
        trunkVolume = 0
        engineStatus = .offline
        windowStatus = .close
    }
    init(model: String, yearOfIssue: UInt, trunkMaxVolume: UInt, trunkVolume: UInt, engineStatus: EngineStatus, windowStatus: WindowStatus) {
        self.model = model
        self.yearOfIssue = yearOfIssue
        self.trunkMaxVolume = trunkMaxVolume
        self.trunkVolume = trunkVolume
        self.engineStatus = engineStatus
        self.windowStatus = windowStatus
    }

}

var carOne = SportCar(model: "Lada", yearOfIssue: 1992, trunkMaxVolume: 1200, trunkVolume: 10, engineStatus: .online, windowStatus: .close)

print("""
    Марка автомобиля - \(carOne.model)
    Год выпуска - \(carOne.yearOfIssue)
    Максимальная загрузка - \(carOne.trunkMaxVolume) кг
    Текущая загрузка - \(carOne.trunkVolume) кг
    Двигатель - \(carOne.engineStatus.rawValue)
    Окна - \(carOne.windowStatus.rawValue)
    """)

var carTwo = SportCar()

print("""

    Второй экземпляр
    
    Марка автомобиля - \(carTwo.model)
    Год выпуска - \(carTwo.yearOfIssue)
    Максимальная загрузка - \(carTwo.trunkMaxVolume) кг
    Текущая загрузка - \(carTwo.trunkVolume) кг
    Двигатель - \(carTwo.engineStatus.rawValue)
    Окна - \(carTwo.windowStatus.rawValue)
    """)
