//
//  GameViewController.swift
//  Millioner
//
//  Created by Артур Кондратьев on 01.06.2022.
//

import UIKit

class GameViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var answeredQuestionsCount : UILabel!
    @IBOutlet weak var qestionLable: UILabel!
    @IBOutlet weak var answerA: UIButton!
    @IBOutlet weak var answerB: UIButton!
    @IBOutlet weak var answerC: UIButton!
    @IBOutlet weak var answerD: UIButton!
    
    @IBAction func answerButtonA(_ sender: Any) {
        if answerA.titleLabel!.text == " " { return }
        checkAnswer(answer: answerA.titleLabel!.text!)
    }
    
    @IBAction func answerButtonB(_ sender: Any) {
        if answerB.titleLabel!.text == " " { return }
        checkAnswer(answer: answerB.titleLabel!.text!)
    }
    
    @IBAction func answerButtonC(_ sender: Any) {
        if answerC.titleLabel!.text == " " { return }
        checkAnswer(answer: answerC.titleLabel!.text!)
    }
    
    @IBAction func answerButtonD(_ sender: Any) {
        if answerD.titleLabel!.text == " " { return }
        checkAnswer(answer: answerD.titleLabel!.text!)
    }
    
    var gameSession = GameSession()
    var qestionsArray: [QuestionsModel] = []
    var completion: ((Int) -> ())?
    
    var fifyFifty: Bool = true
    var callPrompt: Bool = true
    var helpHall: Bool = true
    
    var questionNumber = 0 {
        didSet {
            answeredQuestionsCount.text = "\(questionNumber) / \(qestionsArray.count) "
        }
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.qestionsArray = Game.shared.returnRequestedArray()
        setQuestion()
        answeredQuestionsCount.text = "\(questionNumber) / \(qestionsArray.count) "
    }
    
    // MARK: - Functions
    /// Задаем новый вопрос
    func setQuestion() {
        if questionNumber < qestionsArray.count {
            let curentQuestion = qestionsArray[questionNumber]
            qestionLable.text = curentQuestion.qestion
            answerA.setTitle(curentQuestion.answersA, for:  .normal)
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
        if qestionsArray[questionNumber].coorectAnswer == answer {
            questionNumber += 1
            setQuestion()
        } else {
            gameOver()
        }
    }
    
    /// Конец игры
    func gameOver() {
        completion?(questionNumber)
        let record = GameSession(answeredQuestionCount: questionNumber,
                                 date: Date(),
                                 fifyFifty: fifyFifty,
                                 callPrompt: callPrompt,
                                 helpHall: helpHall)
        Game.shared.addResult(record: record)
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Подсказки
    /// 50/50
    @IBOutlet weak var fiftyFiftyButton: UIButton!
    @IBAction func fiftyFifty(_ sender: Any) {
        if fifyFifty {
            fifyFifty = false
            fiftyFiftyButton.tintColor = .darkGray
            var count = 0
            let curentQuestion = qestionsArray[questionNumber]
            if answerB.titleLabel?.text != curentQuestion.coorectAnswer && count < 2 {
                answerB.setTitle(" ", for: .normal)
                count += 1
            }
            if answerD.titleLabel?.text != curentQuestion.coorectAnswer && count < 2 {
                answerD.setTitle(" ", for: .normal)
                count += 1
            }
            if answerA.titleLabel?.text != curentQuestion.coorectAnswer && count < 2 {
                answerA.setTitle(" ", for: .normal)
                count += 1
            }
        } else {
            showInfo()
        }
    }
    
    /// - Звонок другу
    @IBOutlet weak var callButton: UIButton!
    @IBAction func callFriend(_ sender: Any) {
        if callPrompt {
            showInfoCallFriend()
            callPrompt = false
            callButton.tintColor = .darkGray
        } else {
            showInfo()
        }
    }
    
    /// - Помощь зала
    @IBOutlet weak var halpHallButton: UIButton!
    @IBAction func helpHall(_ sender: Any) {
        if helpHall {
            showInfoHelpHall()
            helpHall = false
            halpHallButton.tintColor = .darkGray
        } else {
            showInfo()
        }
    }
    
    /// - Звонок другу
    func showInfoCallFriend() {
        // Создаем контроллер
        let alert = UIAlertController(title: "Звоним Дмитрию Диброву",
                                      message: "Я думаю что это - \(qestionsArray[questionNumber].coorectAnswer)",
                                      preferredStyle: .alert)
        // Создаем кнопку для UIAlertController
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        // Добавляем кнопку на UIAlertController
        alert.addAction(action)
        // Показываем UIAlertController
        present(alert, animated: true, completion: nil)
    }
    
    /// - Помощь зала
    func showInfoHelpHall() {
        let alert = UIAlertController(title: "Результат опроса зала",
                                      message: "A - 30% " + "B - 20% " + "C - 45% " + "D - 5%",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    /// - Инфо подсказки
    func showInfo() {
        let alert = UIAlertController(title: "Упс...",
                                      message: "Вы уже использовли эту подсказку ;(",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}


