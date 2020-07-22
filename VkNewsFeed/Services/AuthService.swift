//
//  AuthService.swift
//  VkNewsFeed
//
//  Created by Roman Oliinyk on 21.07.2020.
//  Copyright © 2020 Roman Oliinyk. All rights reserved.
//

import Foundation
import VK_ios_sdk

protocol AuthServiceDelegate {
    func authServiceShouldShow(_ viewController: UIViewController!)
    func authServiceSignIn()
    func authServiceSignInFailed()
}

final class AuthService: NSObject, VKSdkDelegate, VKSdkUIDelegate {
    
    private let appID = "7545078"
    private let vkSdk: VKSdk
    
    var delegate: AuthServiceDelegate?
    
    override init() {
        vkSdk = VKSdk.initialize(withAppId: appID)
        super.init()
        print("VkNewsFeed init")
        vkSdk.register(self)
        vkSdk.uiDelegate = self
    }
    
    func wakeUpSession() {
        let scope = ["offline"]
        VKSdk.wakeUpSession(scope) { (state, error) in
            if state == VKAuthorizationState.authorized {
                print("VKAuthorizationState.authorized")
                self.delegate?.authServiceSignIn()
            } else if state == VKAuthorizationState.initialized {
                print("VKAuthorizationState.initialized")
                VKSdk.authorize(scope)
            } else {
                print("auth problems, state \(state) error \(String(describing: error?.localizedDescription))")
                self.delegate?.authServiceSignInFailed()
            }
        }
    }
    
    // MARK: VkSdkDelegate
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print(#function)
        delegate?.authServiceSignIn()
    }
    
    func vkSdkUserAuthorizationFailed() {
        print(#function)
    }
    
    // MARK: VkSdkUIDelegate

    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        print(#function)
        delegate?.authServiceShouldShow(controller)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)
    }
    
    
}
