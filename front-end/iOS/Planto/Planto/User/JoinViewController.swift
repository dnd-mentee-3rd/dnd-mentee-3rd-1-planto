//
//  JoinViewController.swift
//  Planto
//
//  Created by Aaron Lee on 7/31/20.
//  Copyright © 2020 D&D. All rights reserved.
//

import UIKit

class JoinViewController: UIViewController {
    
    var isAutoLogin: Bool = false
    var isAuthenticated = false
    
    // MARK: - IBOutlets
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtNickName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// MARK: - IBActions
extension JoinViewController {
    @IBAction func btnSubmit(_ sender: UIButton) {
        let user = UserUtil()
        
        if (txtEmail.text == "" || txtNickName.text == "" || txtPassword.text == "" || txtConfirmPassword.text == "") {
            alert(message: "입력하시지 않은 정보가 있는지 확인해주세요")
        } else if (txtPassword.text != txtConfirmPassword.text) {
            self.alert(message: "입력하신 비밀번호가 일치하는지 확인해주세요.")
        } else if (!user.isValidEmail(email: txtEmail.text ?? "")) {
            self.alert(message: "올바른 이메일이 맞는지 확인해주세요")
        } else if (user.isExistingEmail(email: txtEmail.text ?? "")) {
            self.alert(message: "존재하는 이메일입니다")
        } else {
            requestJoin()
        }
    }
}

// MARK: - Functions
extension JoinViewController {
    func requestJoin() {
        var responseCode = 200
        
        if (responseCode == 200) {
            isAuthenticated = true
            isAutoLogin = true
            
            UserUtil().saveAllUserDefaults(authenticatedFlag: isAuthenticated,
                                            autoLoginFlag: isAutoLogin,
                                            email: txtEmail.text!,
                                            password: txtPassword.text!)
            
            guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "UserDetailVC")
                else { return }
            self.present(nextVC, animated: true)
            // To Do: Request Log the Created User In
        } else {
            alert(message: "관리자에게 문의해주세요")
        }
    }
    
    func alert(message: String) {
        let seconds: Double = 1.5
        
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.view.backgroundColor = UIColor.lightGray
        alertController.view.alpha = 0.5
        alertController.view.layer.cornerRadius = 15
        self.present(alertController, animated: true, completion: nil)
        
        // Dismiss Automatically
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds, execute: {
            alertController.dismiss(animated: true, completion: nil)
        })
    }
    
}
