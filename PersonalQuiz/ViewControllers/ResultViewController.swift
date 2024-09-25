//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 12.02.2024.
//

import UIKit

final class ResultViewController: UIViewController {
    
    var answersChoosen: [Answer]!
    
    @IBOutlet weak var animalDescriptionLabel: UILabel!
    @IBOutlet weak var animalTypeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculateResult()
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
    
    private func calculateResult() {
        var animalFrequency: [Animal: Int] = [:]
        let animals = answersChoosen.map() { $0.animal }
        animals.forEach {
            animalFrequency[$0, default: 0] += 1
        }
        guard let mostFrequentAnimal = animalFrequency.max(by: { $0.value < $1.value })?.key else {
            return
        }
        updateUI(with: mostFrequentAnimal)
    }
    
    private func updateUI(
        with animal: Animal
    ) {
        animalTypeLabel.text = "Вы - \(animal.rawValue)"
        animalDescriptionLabel.text = animal.definition
    }
}
