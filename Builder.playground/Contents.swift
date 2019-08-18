protocol UnitBuilder {
  var unit: Unit { get set }
  
  func buildTitle()
  func buildType()
  func buildHP()
  
  func build() -> Unit
}

extension UnitBuilder {
  func build() -> Unit {
    buildTitle()
    buildType()
    buildHP()
    return unit
  }
}

class GrenaderBuilder: UnitBuilder {
  var unit: Unit
  
  // MARK: -
  
  init() {
    unit = Unit()
  }
  
  func buildTitle() {
    unit.title = "Grenader"
  }
  
  func buildType() {
    unit.type = .infantry
  }
  
  func buildHP() {
    unit.HP = 90
  }
}

class TankBuilder: UnitBuilder {
  var unit: Unit
  
  // MARK: -
  
  init() {
    unit = Unit()
  }
  
  func buildTitle() {
    unit.title = "Tank"
  }
  
  func buildType() {
    unit.type = .vehicle
  }
  
  func buildHP() {
    unit.HP = 300
  }
}

// MARK: -

enum UnitType: String {
  case infantry
  case vehicle
  case aircraft
  case ship
  
  static let `default` = UnitType.infantry
}

class Unit {
  private static let kDefaultMaxHP = 100
  
  var title: String = ""
  var type: UnitType = UnitType.default
  var HP: Int = kDefaultMaxHP
  
  // MARK: -
  
  func info() {
    print("Unit: \(title). Type: \(type.rawValue). HP: \(HP)")
  }
}

// MARK: -

let grenaderBuilder = GrenaderBuilder()
let grenader = grenaderBuilder.build()
grenader.info()

let tankBuilder = TankBuilder()
let tank = tankBuilder.build()
tank.info()
