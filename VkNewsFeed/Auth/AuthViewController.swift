//
//  AuthViewController.swift
//  VkNewsFeed
//
//  Created by Roman Oliinyk on 21.07.2020.
//  Copyright © 2020 Roman Oliinyk. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    private var authService = AuthService()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func LoginButton(_ sender: UIButton) {
        authService.wakeUpSession()
    }
    
    
}
