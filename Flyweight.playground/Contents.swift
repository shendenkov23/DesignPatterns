//
//  Flyweight
//
//  Created by shendenkov23 on 8/22/19.
//  Copyright © 2019 shendenkov23. All rights reserved.
//

protocol GamemapCell {
  var texture: String { get set }
  var isPassable: Bool { get set }
  var speedCoef: Double { get set }
  
  func info()
}

extension GamemapCell {
  func info() {
    print("=== \(type(of: self)) ===")
    print("Texture:", texture)
    print("isPassable:", isPassable)
    print("speedCoef:", speedCoef)
    print("============")
  }
}

class Land: GamemapCell {
  var texture: String = "texture_Land"
  var isPassable: Bool = true
  var speedCoef: Double = 1.0
}

class Forest: GamemapCell {
  var texture: String = "texture_Forest"
  var isPassable: Bool = true
  var speedCoef: Double = 0.5
}

class Water: GamemapCell {
  var texture: String = "texture_Water"
  var isPassable: Bool = false
  var speedCoef: Double = 0.0
}

class FlyweightFactory {
  private var cells = [Int: GamemapCell]()
  
  func getCharacter(with code: Int) -> GamemapCell {
    if let cell = cells[code] {
      return cell
    } else {
      var cell: GamemapCell?
      switch code {
      case 1:
        cell = Land()
      case 2:
        cell = Forest()
      case 3:
        cell = Water()
      default:
        cell = Land()
      }
      cells[code] = cell
      return cell!
    }
  }
}

let factory = FlyweightFactory()

[1,2,3,1].forEach({
  let cell = factory.getCharacter(with: $0)
  cell.info()
})
