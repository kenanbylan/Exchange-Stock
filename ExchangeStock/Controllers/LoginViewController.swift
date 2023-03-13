//  LoginViewController.swift
//  Onboarding
//  Created by Kenan Baylan on 12.03.2023


import UIKit
import MBProgressHUD


class LoginViewController : UIViewController {
    
    
    
    private let isSuccesfull = true
    var delegate: OnboardingDelegate?
    
    
    let scrollView = UIScrollView()
    
    
    //MARK: - UIElements
    @IBOutlet weak var segmentedControl : UISegmentedControl!
    @IBOutlet weak var informationLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var confirmTextfield: UITextField!
    
    @IBOutlet weak var forgetPasswordButton : UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var lastnameTextfield: UITextField!
    @IBOutlet weak var phoneTextfield: UITextField!
    
    
    
    
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //Sayfa yüklendiği anlat keyboard otomatik olarak emaile focuslanması için kullanılır.
        
        if currentPageType == .login  {
            emailTextField.becomeFirstResponder()
        } else {
            nameTextfield.becomeFirstResponder()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewFor(pageType: .login) //default olarak login ile başlıyoruz.
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //     settingScrollView()
        
    }
    
    private func settingScrollView(){
        
        view.addSubview(self.scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leftAnchor.constraint (equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    
    //MARK: UI func properties
    private func setupViewFor(pageType: PageType) {
        
        //confirmTextfield.isHidden = pageType == .login = .login
        
        confirmTextfield.isHidden = pageType == .login
        signUpButton.isHidden = pageType == .login
        forgetPasswordButton.isHidden = pageType == .signUp
        loginButton.isHidden = pageType == .signUp
        informationLabel.text = nil
        
        
        //login ise bu texfieldi gizle.
        nameTextfield.isHidden = pageType == .login
        lastnameTextfield.isHidden = pageType == .login
        phoneTextfield.isHidden = pageType == .login
        
        
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
        
        MBProgressHUD.showAdded(to: view, animated: true)
        
        delay(durationInSeconds: 2.0) {
            MBProgressHUD.hide(for: self.view, animated: true)
            if self.isSuccesfull {
                
                self.delegate?.showTabbarController()
            } else {
                
                self.informationLabel.text = "Your password invalid. Please try again."
            }
        }
    }
    
    @IBAction func segmentedControlChanged(_ sender : UISegmentedControl) {
        
        //if let
        currentPageType = sender.selectedSegmentIndex == 0 ? .login : .signUp
        
    }
}

