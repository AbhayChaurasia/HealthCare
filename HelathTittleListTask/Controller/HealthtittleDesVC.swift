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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // Add topic label
        view.addSubview(topicLabel)
        NSLayoutConstraint.activate([
            topicLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topicLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
        
        // Add description label
        view.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            descriptionLabel.topAnchor.constraint(equalTo: topicLabel.bottomAnchor, constant: 20)
        ])
        
        // Set topic name and description
        
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
        self.navigationController?.navigationBar.topItem?.title = "Health Topic Description"
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.lightGray
    }
     func showActivityIndicator() {
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = false
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
    }
    
    // MARK: - Method to stop activity indicator
    private func stopActivityIndicator() {
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
    }
    private func stopUIOperation() {
        setData()
        self.stopActivityIndicator()
        self.refreshControl.endRefreshing()
    }
}
