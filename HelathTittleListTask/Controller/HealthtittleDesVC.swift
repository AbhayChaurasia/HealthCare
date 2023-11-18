//
//  HealthtittleDesVC.swift
//  HelathTittleListTask
//
//  Created by Abhay Chaurasia on 17/11/23.
//

import UIKit


class HealthtittleDesVC: UIViewController {
    
    
    var topicName: String?
    var descriptionText: String?
    var topicID = ""
    private var viewModel = HealthDesViewModel()
    let activityIndicator = UIActivityIndicatorView(style: .large)
    let refreshControl = UIRefreshControl()
    
    
    let topicLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    let scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
        }()
    let contentView: UIView = {
           let view = UIView()
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.setUI()
        self.loadDescription()
        self.setData()
        self.setNavigationBarTitle()
    }
    
    
    private func loadDescription() {
        showActivityIndicator()
        viewModel.fetchHealthDes(id: topicID) { status in
            DispatchQueue.main.async {
                if status == .NetworkError {
                    self.displayNetworkReachabilityAlert()
                }
                self.stopUIOperation()
            }
        }
    }
    
    func setData() {
        topicLabel.text = viewModel.showTittleAndDes().title ?? ""
        
        let htmlString = viewModel.showTittleAndDes().content ?? ""
        
        descriptionLabel.text = htmlString.htmlToString
        
    }
    func displayNetworkReachabilityAlert() {
        let alertView = UIAlertController(title: alertTitle, message: alertDescription, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
        })
        alertView.addAction(ok)
        self.present(alertView, animated: true, completion: nil)
    }
    // MARK: - Set Navigation Bar Appearance
    private func setNavigationBarTitle() {
         title = "Health Topic Description"
        self.navigationController?.navigationBar.backgroundColor = navBarColor
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
     func showActivityIndicator() {
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = false
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
    }
    
   
}

