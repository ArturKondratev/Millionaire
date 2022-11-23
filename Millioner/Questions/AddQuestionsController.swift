//
//  AddQuestionsController.swift
//  Millioner
//
//  Created by Артур Кондратьев on 16.06.2022.
//

import UIKit

class AddQuestionsController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var questionsText: UITextField!
    @IBOutlet weak var answerA: UITextField!
    @IBOutlet weak var answerB: UITextField!
    @IBOutlet weak var answerC: UITextField!
    @IBOutlet weak var answerD: UITextField!
    @IBOutlet weak var correctAnswer: UISegmentedControl!
    private let questionsCaretaker = QuestionCaretaker()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let hideKeyBoardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(hideKeyBoardGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyBoardWasShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyBoardWillBeHidden(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    //MARK: - Private properties
    private var corAnswer: String {
        switch correctAnswer.selectedSegmentIndex {
        case 0:
            return answerA.text ?? ""
        case 1:
            return answerB.text ?? ""
        case 2:
            return answerC.text ?? ""
        case 3:
            return answerD.text ?? ""
        default:
            return answerD.text ?? ""
        }
    }
    
    //MARK: - Functions
    @IBAction func addQuestionButton(_ sender: Any) {
        guard questionsText.hasText,
              answerA.hasText,
              answerB.hasText,
              answerC.hasText,
              answerD.hasText
        else {
            showError()
            return
        }
        
        let newQuestion = QuestionsModel(qestion: questionsText.text!,
                                         coorectAnswer: corAnswer,
                                         answersA: answerA.text!,
                                         answersB: answerB.text!,
                                         answersC: answerC.text!,
                                         answersD: answerD.text!)
        questionsCaretaker.save(questions: [newQuestion])
        clearTextFild()
    }
    
    func clearTextFild() {
        self.questionsText.text = ""
        self.answerA.text = ""
        self.answerB.text = ""
        self.answerC.text = ""
        self.answerD.text = ""
    }
    
    func showError() {
        // Создаем контроллер
        let alert = UIAlertController(title: "Ошибка", message: "Необходимо ввести все поля", preferredStyle: .alert)
        // Создаем кнопку для UIAlertController
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        // Добавляем кнопку на UIAlertController
        alert.addAction(action)
        // Показываем UIAlertController
        present(alert, animated: true, completion: nil)
    }
    
    // клик по любому месту scrollView для скрытия клавиатуры
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
    @objc func keyBoardWasShow(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.height, right: 0)
        scrollView.contentInset = contentInset
        scrollView.scrollIndicatorInsets = contentInset
    }
    
    @objc func keyBoardWillBeHidden(notification: Notification) {
        let contentInset = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
}
