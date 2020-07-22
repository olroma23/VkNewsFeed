//
//  AuthViewController.swift
//  VkNewsFeed
//
//  Created by Roman Oliinyk on 21.07.2020.
//  Copyright © 2020 Roman Oliinyk. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    private var authService: AuthService?

    override func viewDidLoad() {
        super.viewDidLoad()
        authService = AppDelegate.shared()?.authService
    }
    
    @IBAction func LoginButton(_ sender: UIButton) {
        authService?.wakeUpSession()
    }
    
    
}
