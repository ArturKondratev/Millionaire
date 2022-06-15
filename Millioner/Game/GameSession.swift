//
//  GameSession.swift
//  Millioner
//
//  Created by Артур Кондратьев on 28.05.2022.
//

import Foundation
import UIKit

class GameSession {

    var onGameEnd: ((Int) -> Void)?
    
    var game: Game?
    
    ///  количество правильных ответов
    var correctAnswersCount: Int = 0
    
    /// количество вопросов
    var coun = Questions.needQestions().count

//    func correctAnswer() {
//        game?.results += 1
//        correctAnswersCount += 1
//        
//    }
    
//    func gameOver() {
//       guard let game = self.game else { return }
//        self.onGameEnd?(game.results)
//    }
    
    
    
   
    
    
}
