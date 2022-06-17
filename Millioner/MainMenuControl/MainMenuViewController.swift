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
    
    
    @IBOutlet weak var difficultyControl: UISegmentedControl! {
        didSet {
            print(difficultyControl.selectedSegmentIndex)
        }
    }
    
    private var selectedDifficulty: Difficulty {
        switch self.difficultyControl.selectedSegmentIndex {
        case 0:
            return .easy
        case 1:
            return .hard
        default:
            return .easy
        }
    }
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "startGameSegue":
            guard let destination = segue.destination as? GameViewController else { return }
            destination.difficulty = self.selectedDifficulty
            destination.completion = { [weak self] result in
                self?.lastResultLabel.text = "Последний результат: \(result)"
            }
            
        default:
            break
        }
    }
}

