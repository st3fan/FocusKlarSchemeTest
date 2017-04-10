//
//  ViewController.swift
//  FocusKlarSchemeTest
//
//  Created by Stefan Arentz on 4/10/17.
//  Copyright © 2017 Stefan Arentz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var focusLabel: UILabel!
    @IBOutlet weak var klarLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        if UIApplication.shared.canOpenURL(URL(string: "firefox-focus://foo")!) {
            focusLabel.text = focusLabel.text! + "installed"
        } else {
            focusLabel.text = focusLabel.text! + "not installed"
        }

        if UIApplication.shared.canOpenURL(URL(string: "firefox-klar://foo")!) {
            klarLabel.text = klarLabel.text! + "installed"
        } else {
            klarLabel.text = klarLabel.text! + "not installed"
        }
    }

}

