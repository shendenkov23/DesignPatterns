//
//  Composite
//
//  Created by shendenkov23 on 8/21/19.
//  Copyright © 2019 shendenkov23. All rights reserved.
//

// Component
protocol Squadable {
  var title: String { get }
  var hpAmount: Double { get }
  func heal(hp: Double)
}

// Composite
class Squad: Squadable {
  private var _title: String

  private var _hpAmount: Double {
    get {
      var hp = 0.0

      for subunit in subunits {
        hp += subunit.hpAmount
      }
      return hp
    }
    set {
// yes, I know this is not fair :)
// units that are higher in the hierarchy will get more points

      let splitCount = Double(subunits.count)
      let splitHp = (newValue - _hpAmount) / splitCount
      for subunit in subunits {
        subunit.heal(hp: splitHp)
      }
    }
  }

  private let subunits: [Squadable]

  var title: String { return _title }
  var hpAmount: Double { return _hpAmount }

  init(title: String, subunits: [Squadable] = []) {
    self._title = title
    self.subunits = subunits
  }

  func heal(hp: Double) {
    _hpAmount += hp
  }
}

// Leaf
class Unit: Squadable {
  private var _title: String
  private var _hpAmount: Double = 1

  var title: String { return _title }
  var hpAmount: Double { return _hpAmount }

  init(title: String) {
    self._title = title
  }

  func heal(hp: Double) {
    print("UNIT. \(title) HEAL:", hp)
    _hpAmount += hp
  }
}

// MARK: -

let joan = Unit(title: "Joan")
let tom = Unit(title: "Tom")
let cleo = Unit(title: "Cleo")
let alex = Unit(title: "Alex")

let littleSquad = Squad(title: "Strong Squad", subunits: [cleo, alex])
let bigSquad = Squad(title: "Invincible squad", subunits: [joan, tom, littleSquad])

print("BEFORE HEAL:")
[joan, tom, cleo, alex].forEach {
  print("Unit \($0.title) have \($0.hpAmount) HP")
}

print("===================")

let kLittleHeal = 100.0
littleSquad.heal(hp: kLittleHeal)
print("\nAFTER HEAL[\(kLittleHeal)] LITTLE SQUAD:")
[joan, tom, cleo, alex].forEach {
  print("Unit \($0.title) have \($0.hpAmount) HP")
}

print("===================")

let kBigHeal = 200.0
bigSquad.heal(hp: kBigHeal)
print("\nAFTER HEAL[\(kBigHeal)] BIG SQUAD:")
[joan, tom, cleo, alex].forEach {
  print("Unit \($0.title) have \($0.hpAmount) HP")
}
