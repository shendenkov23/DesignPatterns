//
//  Bridge
//
//  Created by shendenkov23 on 8/21/19.
//  Copyright © 2019 shendenkov23. All rights reserved.
//

// MARK: - BRIDGE

// Abstraction
protocol Unit {
  var title: String { get set }
  var type: String { get set }
  var hp: Int { get set }

  var logger: Logger { get set }
  init(logger: Logger)
  func info()
}

// Implementor
protocol Logger {
  func info(unit: Unit)
}

// MARK: -

// Concrete Implementor A
class BadLogger: Logger {
  let radiusMultiplier = 0.25

  func info(unit: Unit) {
    print("some", unit.title)
  }
}

// Concrete Implementor B
class GoodLogger: Logger {
  let radiusMultiplier = 10.0

  func info(unit: Unit) {
    print("--- UNIT ---")
    print("TITLE:\t", unit.title)
    print("TYPE:\t", unit.type)
    print("HP:\t\t", unit.hp)
    print("------------")
  }
}

// Refined Abstraction
class Grenader: Unit {
  var title: String
  var type: String
  var hp: Int
  var logger: Logger

  required init(logger: Logger) {
    self.title = "Grenader"
    self.type = "Infantry"
    self.hp = 100

    self.logger = logger
  }

  func info() {
    logger.info(unit: self)
  }
}

// MARK: -

let goodLoggedGrenader = Grenader(logger: GoodLogger())
let badLoggedGrenader = Grenader(logger: BadLogger())

print("GOOD LOG:")
goodLoggedGrenader.info()
print("\nBAD LOG:")
badLoggedGrenader.info()
