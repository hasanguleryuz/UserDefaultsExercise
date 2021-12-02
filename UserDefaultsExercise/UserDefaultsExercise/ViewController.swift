//
//  ViewController.swift
//  UserDefaultsExercise
//
//  Created by Hasan Guleryuz on 2.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lastRecordedNumberStackView: UIStackView!
    @IBOutlet weak var lastRecordedNumberLabel: UILabel!
    @IBOutlet weak var enteredNumberTextField: UITextField!
    @IBOutlet weak var recordNumberButton: UIButton!
    @IBOutlet weak var clearRecordedNumberButton: UIButton!

    @IBAction func recodTheNumber() {
        guard let stringNumber = enteredNumberTextField.text,
              let number = Int.init(stringNumber) else { return }
        PersistentKeeper.shared.lastRecordedNumber = number
        enteredNumberTextField.text = nil
        configureViews()
    }

    @IBAction func clearRecodedNumber() {
        PersistentKeeper.shared.lastRecordedNumber = -1
        configureViews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }

    private func configureViews() {
        let recordedNumber = PersistentKeeper.shared.lastRecordedNumber
        let hasRecordedNumber = recordedNumber != -1
        lastRecordedNumberStackView.isHidden = !hasRecordedNumber
        clearRecordedNumberButton.isHidden = !hasRecordedNumber
        lastRecordedNumberLabel.text = "- \(String(describing: recordedNumber)) -"
    }
}

