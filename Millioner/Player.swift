//
//  Player.swift
//  Millioner
//
//  Created by Артур Кондратьев on 28.05.2022.
//

import Foundation

class Player {
    
    /// количество угаданных вопросов
    var score: Int = 0
    /// сумма выигрышо
    var money: Int = 0
    
    ///  звонок другу
    var callFriends = true
    /// 50/50
    var fiftyFifty = true
    ///  помощь зала
    var hallHelp = true
    
    func addScore() {
        score += 1
        money += 1000
    }
  
    
}
