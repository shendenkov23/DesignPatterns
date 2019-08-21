//
//  Adapter (inheritance)
//
//  Created by shendenkov23 on 8/21/19.
//  Copyright © 2019 shendenkov23. All rights reserved.
//


// Model
class Unit {
  var type: String
  var title: String

  init(type: String, title: String) {
    self.type = type
    self.title = title
  }
}

// MARK: -

// Target
protocol UnitCreator {
  func createInfantry() -> Unit
  func createVehicle() -> Unit
  func createAircraft() -> Unit
}

// Adaptee
class UnitFactory {
  func createGrenader() -> Unit {
    return Unit(type: "Infantry", title: "Grenader")
  }

  func createTank() -> Unit {
    return Unit(type: "Vehicle", title: "Tank")
  }

  func createHelicopter() -> Unit {
    return Unit(type: "Aircraft", title: "Helicopter")
  }
}

// Adapter
class FactoryAdapter: UnitFactory, UnitCreator {
  func createInfantry() -> Unit {
    return createGrenader()
  }

  func createVehicle() -> Unit {
    return createTank()
  }

  func createAircraft() -> Unit {
    return createHelicopter()
  }
}

func info(_ unit: Unit) {
  print("UNIT. TYPE:", unit.type, "\tTITLE:", unit.title)
}

// MARK: -

let factory = FactoryAdapter()
var unit = factory.createInfantry()
info(unit)
unit = factory.createVehicle()
info(unit)
unit = factory.createAircraft()
info(unit)
