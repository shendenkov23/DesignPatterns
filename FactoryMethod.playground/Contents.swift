//
//  Factory method
//
//  Created by shendenkov23 on 8/19/19.
//  Copyright © 2019 shendenkov23. All rights reserved.
//

protocol Unit {
  func getTitle() -> String
}

class Footman: Unit {
  func getTitle() -> String {  return "Footman" }
}

class Archer: Unit {
  func getTitle() -> String { return "Archer" }
}

protocol Spawner {
  func createUnit() -> Unit
}

class FootmanSpawner: Spawner {
  func createUnit() -> Unit { return Footman() }
}

class ArcherSpawner: Spawner {
  func createUnit() -> Unit { return Archer() }
}

let spawners: [Spawner] = [FootmanSpawner(),
                           ArcherSpawner()]

spawners.forEach {
  let unit = $0.createUnit()
  print(unit.getTitle())
}
