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

    func update() {
        print("Updating")

        if UIApplication.shared.canOpenURL(URL(string: "firefox-focus://foo")!) {
            focusLabel.text = "Firefox Focus is installed"
        } else {
            focusLabel.text = "Firefox Focus is not installed"
        }

        if UIApplication.shared.canOpenURL(URL(string: "firefox-klar://foo")!) {
            klarLabel.text = "Firefox Klar is installed"
        } else {
            klarLabel.text = "Firefox Klar is not installed"
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.applicationDidBecomeActive), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
    }

    func applicationDidBecomeActive(notification: Notification) {
        update()
    }
}
