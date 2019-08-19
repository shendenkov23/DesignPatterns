//
//  Prototype
//
//  Created by shendenkov23 on 8/19/19.
//  Copyright © 2019 shendenkov23. All rights reserved.
//

import Foundation

protocol Clonable {
  func clone() -> Self
  init(clone: Self)
}

extension Clonable {
  func clone() -> Self {
    return type(of: self).init(clone: self)
  }
}

// MARK: -
  
class Unit: Clonable {
  private var title: String
  private var hp: Int

  // MARK: -

  init(title: String, hp: Int) {
    self.title = title
    self.hp = hp
  }
  
  required init(clone: Unit) {
    title = clone.title
    hp = clone.hp
  }

  func info() {
    print("Unit: \(title) HP:\(hp)")
  }
  
  func damage(_ damage: Int) {
    hp -= damage
  }
}

// MARK: -

let footman1 = Unit(title: "Footman", hp: 100)
let footman2 = footman1.clone()
footman1.damage(10)
let footman3 = footman1.clone()

footman1.info()
footman2.info()
footman3.info()
