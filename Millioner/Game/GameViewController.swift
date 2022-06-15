//
//  GameViewController.swift
//  Millioner
//
//  Created by Артур Кондратьев on 01.06.2022.
//

import UIKit

class GameViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var qestionLable: UILabel!
    @IBOutlet weak var answerA: UIButton!
    @IBOutlet weak var answerB: UIButton!
    @IBOutlet weak var answerC: UIButton!
    @IBOutlet weak var answerD: UIButton!
    
    @IBAction func answerButtonA(_ sender: Any) {
        checkAnswer(answer: answerA.titleLabel!.text!)
    }
    
    @IBAction func answerButtonB(_ sender: Any) {
        checkAnswer(answer: answerB.titleLabel!.text!)
    }
    
    @IBAction func answerButtonC(_ sender: Any) {
        checkAnswer(answer: answerC.titleLabel!.text!)
    }
    
    @IBAction func answerButtonD(_ sender: Any) {
        checkAnswer(answer: answerD.titleLabel!.text!)
    }
    
    var completion: ((Int) -> ())?
    /// счетчик правильных ответов
    var correctAnswerCounter = 0
    /// массив с вопросами
    lazy var questions = createQuestionsStrategy.createGame()
    
    var difficulty: Difficulty = .easy
    
    private var createQuestionsStrategy: CreateGameStrategy {
        switch self.difficulty {
        case .easy:
            return NormalQuestionsStrategy()
        case .hard:
            return RandomQuestionsStrategy()
        }
    }
    

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setQuestion()
        
    }
    
    // MARK: - Functions
    
    /// Задаем новый вопрос
    func setQuestion() {
        if correctAnswerCounter < questions.count {
            
            let curentQuestion = questions[correctAnswerCounter]
            qestionLable.text = curentQuestion.qestion
            answerA.setTitle(curentQuestion.answersA, for: .normal)
            answerB.setTitle(curentQuestion.answersB, for: .normal)
            answerC.setTitle(curentQuestion.answersC, for: .normal)
            answerD.setTitle(curentQuestion.answersD, for: .normal)
        } else {
            gameOver()
        }
    }
    
    /// Проверяем ответ
    /// - Parameter answer: текст ответа
    func checkAnswer(answer: String) {
        if questions[correctAnswerCounter].coorectAnswer == answer {
            correctAnswerCounter += 1
            setQuestion()
        } else {
            gameOver()
        }
    }
    
    /// Конец игры
    func gameOver() {
        completion?(correctAnswerCounter)
        let record = Record(date: Date(), score: correctAnswerCounter)
        Game.shared.addRecord(record)
        self.dismiss(animated: true, completion: nil)
    }
}


