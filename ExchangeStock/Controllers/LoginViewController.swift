//  LoginViewController.swift
//  Onboarding
//  Created by Kenan Baylan on 12.03.2023


import UIKit

class LoginViewController : UIViewController {
    
    private let isSuccesfull = false
     var delegate: OnboardingDelegate?
    
    

    //MARK: - UIElements
    @IBOutlet weak var segmentedControl : UISegmentedControl!
    @IBOutlet weak var informationLabel: UILabel!

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var confirmTextfield: UITextField!
    
    @IBOutlet weak var forgetPasswordButton : UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    
    
    private enum PageType {
        case login
        case signUp
    }
    
    private var currentPageType: PageType  = .login {
        didSet {
            setupViewFor(pageType: currentPageType)
            
        }
    }
    
    
    private var errorMessage: String = "" {
        
        didSet {
            showErrorMessageIfNeed(text: errorMessage)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewFor(pageType: .login) //default olarak login ile başlıyoruz.

    }
    
    
    private func setupViewFor(pageType: PageType) {
        //confirmTextfield.isHidden = pageType == .login = .login
        
        confirmTextfield.isHidden = pageType == .login
        signUpButton.isHidden = pageType == .login
        forgetPasswordButton.isHidden = pageType == .signUp
        loginButton.isHidden = pageType == .signUp
        informationLabel.text = nil
        
    }
    
    
    
    private func showErrorMessageIfNeed(text: String?) {
        
        if text == nil  {
            informationLabel.isHidden = true
        }
        
        informationLabel.text = text
        
        
    }
    
    
    //MARK: - Actions
    @IBAction func forgotPasswordButtonTapped(_ sender: Any) {
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        
        if isSuccesfull {
            delegate?.showTabbarController()
        } else {
            informationLabel.text = "Your password invalid. Please try again."
        }
        
    }
    
    @IBAction func segmentedControlChanged(_ sender : UISegmentedControl) {
        
        //if let
        currentPageType = sender.selectedSegmentIndex == 0 ? .login : .signUp
        
    }
}

