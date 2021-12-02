//
//  PersistentKeeper.swift
//  UserDefaultsExercise
//
//  Created by Hasan Guleryuz on 2.12.2021.
//

import Foundation

final class PersistentKeeper {
    static var shared = PersistentKeeper()

    // I seted initial int value -1 because, if the specified key doesn‘t exist, get method returns 0.
    var lastRecordedNumber: Int = -1 {
        didSet {
            UserDefaults.standard.setValue(lastRecordedNumber, forKey: UserDefaultsKeys.lasRecordedNumber)
        }
    }

    private init() {
        lastRecordedNumber = UserDefaults.standard.integer(forKey: UserDefaultsKeys.lasRecordedNumber)
    }
    
}
