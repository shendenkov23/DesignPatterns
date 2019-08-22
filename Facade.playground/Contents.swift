//
//  Facade
//
//  Created by shendenkov23 on 8/22/19.
//  Copyright © 2019 shendenkov23. All rights reserved.
//

class GamemapService {
  func createMap() {
    print("[GamemapService] Gamemap created.")
    createLandscape()
    createObtacles()
  }
  
  func placePlayers() {
    print("[GamemapService] Players placed.")
  }
  
  func placeMobs() {
    print("[GamemapService] Mobs placed.")
  }
  
  private func createLandscape() {
    print("[GamemapService] Landscape created.")
  }
  
  private func createObtacles() {
    print("[GamemapService] Obtackles created and placed.")
  }
}

class PlayersService {
  func createPlayers() {
    print("[PlayersService] Players created.")
    assignTeams()
  }
  
  private func assignTeams() {
    print("[PlayersService] Teams assigned.")
  }
}

class MobsService {
  func createNeutralMobs() {
    print("[MobsService] Neutral mobs Created.")
  }
}

// Facade
class Game {
  private let gamemapService = GamemapService()
  private let playersService = PlayersService()
  private let mobsService = MobsService()

  func start() {
    gamemapService.createMap()
    playersService.createPlayers()
    gamemapService.placePlayers()
    mobsService.createNeutralMobs()
    gamemapService.placeMobs()
    
    print("`Ready. Press any key!")
  }
}

/* Client */

let game = Game()
game.start()
