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

let creators: [Creator] = [FootmanSpawner(),
                           ArcherSpawner()]

creators.forEach {
  let unit = $0.createUnit()
  print(unit.getTitle())
}
