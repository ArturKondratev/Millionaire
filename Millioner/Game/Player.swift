//
//  Player.swift
//  Millioner
//
//  Created by Артур Кондратьев on 09.06.2022.
//

import Foundation

class Player: Codable {
    
    var score = 0
    
    
    func correctAnswer() {
        score += 1
    }
    
    
}


typealias Momento = Date
