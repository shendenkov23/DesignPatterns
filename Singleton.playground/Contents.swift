//
//  Singleton
//
//  Created by shendenkov23 on 8/19/19.
//  Copyright © 2019 shendenkov23. All rights reserved.
//

import Foundation

extension Date {
  var string: String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy.MM.dd HH:mm:ss.SSS"
    return formatter.string(from: self)
  }
}

// SINGLETON
class Game {
  static let shared = Game()
  private init() {
    createDate = Date()
    print("\(createDate.string) Game created!")
  }

  // MARK: -

  let createDate: Date
  var startDate: Date?

  var gameTime: TimeInterval {
    if let startDate = startDate {
      return Date().timeIntervalSince(startDate)
    } else {
      return 0
    }
  }

  // MARK: -

  func start() {
    let date = Date()
    startDate = date
    print("\(date.string) Game started!")
  }

  func pause() {
    print("[\(gameTime)] Game paused!")
  }

  func resume() {
    print("[\(gameTime)] Game resumed!")
  }
}

class Factory {
  func createUnit() {
    let gameTime = Game.shared.gameTime // Singleton's property
    print("[\(gameTime)] Factory: Unit created!")
  }
}

class GameMenu {
  func btnPauseAction() {
    Game.shared.pause() // Singleton's method
  }

  func btnResumeAction() {
    Game.shared.resume() // Singleton's method
  }
}

// MARK: -

let game = Game.shared
game.start()

Factory().createUnit()

let menu = GameMenu()
menu.btnPauseAction()
menu.btnResumeAction()
