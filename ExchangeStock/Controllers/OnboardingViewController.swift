//
//  OnboardingViewController.swift
//  Onboarding

//  Created by Kenan Baylan on 12.03.2023.
//

import UIKit




protocol OnboardingDelegate {
    
    func showTabbarController()
    
}



class OnboardingViewController : UIViewController {
    
    
    //MARK: UIElements
    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var collectionView : UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupCollectionViews()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
    }
    
    //MARK: - Functions
    private func setupCollectionViews() {
        
        let layout = UICollectionViewFlowLayout();
        layout.scrollDirection = .horizontal
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
    }
    
    private func setupViews(){
        
        view.backgroundColor = .systemGroupedBackground
        
        getStartedButton.layer.cornerRadius = 10
        getStartedButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        getStartedButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        getStartedButton.layer.shadowOpacity = 1.0
        getStartedButton.layer.shadowRadius = 0.0
        getStartedButton.layer.masksToBounds = false
        
        pageControl.numberOfPages = Slide.collectionViewData.count
    }
    
    
    private func showCaptions(atIndex index: Int) {
        
        let slide = Slide.collectionViewData[index]
        titleLabel.text = slide.title
        descriptionLabel.text = slide.description
        
    }
    
    //MARK: Actions
    @IBAction func getStartedButtonTapped(_ sender: UIButton) {
        
        print("get Started Button Tapped")
        performSegue(withIdentifier: K.Segue.showLoginSignup , sender: nil)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.Segue.showLoginSignup {
            if let destination = segue.destination as? LoginViewController {
                destination.delegate = self
            }
            
        }
    }
    
}



extension OnboardingViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Slide.collectionViewData.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "onboardingCollectionViewCell", for: indexPath) as! OnboardingCollectionViewCell
        
        let imageName = Slide.collectionViewData[indexPath.row].imageName
        cell.configure(image: UIImage(named: imageName)!)
        
        return cell
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    
    //collection viewlar arasındaki boşluğu belirtiriz.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //collectionViewe her bir scrool ettiğimizde hangi imagede olduğunun indisini bize verir.
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        showCaptions(atIndex: index)
        
        self.pageControl.currentPage = index
    }
    
}

extension OnboardingViewController : OnboardingDelegate {
    
    func showTabbarController() {
        
        //dismiss the loginViewController
        //show mainTabbarController.
        
        if let loginViewController = self.presentedViewController as? LoginViewController {
            
            loginViewController.dismiss(animated: true) {
                PresenterManager.shared.showVC(vc: .mainTabbarController)
            }
        }
    }
    
    
    
}

