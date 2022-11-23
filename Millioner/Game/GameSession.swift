//
//  GameSession.swift
//  Millioner
//
//  Created by Артур Кондратьев on 15.06.2022.
//

import Foundation

struct GameSession: Codable {
    
    var answeredQuestionCount: Int?
    var date: Date?
    var fifyFifty: Bool = true
    var callPrompt: Bool = true
    var helpHall: Bool = true
}

 
