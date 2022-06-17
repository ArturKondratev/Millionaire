//
//  SettingsControl.swift
//  Millioner
//
//  Created by Артур Кондратьев on 15.06.2022.
//

import Foundation
import UIKit

class SettingsControl: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var segmentControl: UISegmentedControl!
   
    private var selectedDifficulty: Difficulty {
        switch self.segmentControl.selectedSegmentIndex {
        case 0:
            return .sequence
        default:
            return .random
        }
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentChangeValue()
    }
    
    //MARK: - Functions
    func segmentChangeValue() {
        segmentControl.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
    }
    
    @objc func valueChanged() {
        Game.shared.questionOrder = selectedDifficulty
    }
    
}




