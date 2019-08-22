//
//  Decorator
//
//  Created by shendenkov23 on 8/22/19.
//  Copyright © 2019 shendenkov23. All rights reserved.
//

// Core component
protocol Unit {
  func getHealth() -> Int
}

// Concrete component A
struct Grenader: Unit {
  func getHealth() -> Int {
    return 100
  }
}

// Concrete component B
struct Tank: Unit {
  func getHealth() -> Int {
    return 400
  }
}

// Decorator
protocol UnitType: Unit {
  var base: Unit { get }
}

// Concrete decorator A
struct Warlord: UnitType {
  var base: Unit
  
  func getHealth() -> Int {
    return base.getHealth() * 2
  }
  
  // New responsibility
  func boostMorale() {
    print("*sound of the drums*")
  }
}

// Concrete decorator B
struct Veteran: UnitType {
  var base: Unit
  
  func getHealth() -> Int {
    return Int(Double(base.getHealth()) * 1.2)
  }
}

let grenader = Grenader()
print("Grenader. HP:", grenader.getHealth())

let grenaderWarlord = Warlord(base: grenader)
print("Grenader Warlord. HP:", grenaderWarlord.getHealth())

let veteranGrenaderWarlord = Veteran(base: grenaderWarlord)
print("Veteran Grenader Warlord. HP:", veteranGrenaderWarlord.getHealth())

let doubleVeteranGrenaderWarlord = Veteran(base: veteranGrenaderWarlord)
print("Double Veteran Grenader Warlord. HP:", doubleVeteranGrenaderWarlord.getHealth())

let tank = Tank()
print("Tank. HP:", tank.getHealth())

let tankWarlord = Warlord(base: tank)
print("Tank Warlord. HP:", tankWarlord.getHealth())
tankWarlord.boostMorale()


