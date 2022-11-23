//
//  MainMenuViewController.swift
//  Millioner
//
//  Created by Артур Кондратьев on 27.05.2022.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet var startGameButton: UIButton!
    @IBOutlet var lastResultLabel: UILabel!
    let recordsCaretaker = RecordsCaretaker()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getInfo()
    }
    
    func getInfo() {
        if let count = recordsCaretaker.retrieveRecords().last?.answeredQuestionCount {
            self.lastResultLabel.text = "Последний результат: " + "\(count)"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "startGameSegue":
            guard let destination = segue.destination as? GameViewController else { return }
            destination.completion = { [weak self] result in
                self?.lastResultLabel.text = "Последний результат: \(result)"
            }
        default:
            break
        }
    }
}

