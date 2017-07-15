//
//  EscondeTeclado.swift
//  Pokedex
//
//  Created by Felipe Silva on 01/06/17.
//  Copyright © 2017 Felipe Silva. All rights reserved.
//

import UIKit

extension SettingsVC {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SettingsVC.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
