//
//  AbstractFactory
//
//  Created by shendenkov23 on 8/18/19.
//  Copyright © 2019 shendenkov23. All rights reserved.
//

protocol AbstractFactory {
  func createFootman() -> AbstractFootman
  func createArcher() -> AbstractArcher
}

protocol AbstractFootman {
  func fight()
}

extension AbstractFootman {
  func fight() {
    print("\(type(of: self)) fight!")
  }
}

protocol AbstractArcher {
  func fire()
}

extension AbstractArcher {
  func fire() {
    print("\(type(of: self)) fire!")
  }
}

// MARK: - Factories

class RedFactory: AbstractFactory {
  public func createFootman() -> AbstractFootman {
    return RedFootman()
  }

  public func createArcher() -> AbstractArcher {
    return RedArcher()
  }
}

class BlueFactory: AbstractFactory {
  public func createFootman() -> AbstractFootman {
    return BlueFootman()
  }

  public func createArcher() -> AbstractArcher {
    return BlueArcher()
  }
}

// MARK: - RED TEAM

class RedFootman: AbstractFootman {}

class RedArcher: AbstractArcher {}

// MARK: - BLUE TEAM

class BlueFootman: AbstractFootman {}

class BlueArcher: AbstractArcher {}

// MARK: -

class Player {
  private let footman: AbstractFootman
  private let archer: AbstractArcher

  public init(factory: AbstractFactory) {
    footman = factory.createFootman()
    archer = factory.createArcher()
  }

  public func run() {
    footman.fight()
    archer.fire()
  }
}


// MARK: - Start

let redFactory = RedFactory()
let redPlayer = Player(factory: redFactory)
redPlayer.run()

let blueFactory = BlueFactory()
let bluePlayer = Player(factory: blueFactory)
bluePlayer.run()
