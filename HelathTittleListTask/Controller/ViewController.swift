//
//  ViewController.swift
//  HelathTittleListTask
//
//  Created by Abhay Chaurasia on 17/11/23.
//

import UIKit



class ViewController: UIViewController  {
    
    let tableview  = UITableView()
     var viewModel = HealthViewModel()
    let activityIndicator = UIActivityIndicatorView(style: .large)
    let refreshControl = UIRefreshControl()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        self.loadHealthTittle()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Set Navigation Bar Appearance
    private func setNavigationBarTitle() {
        self.navigationController?.navigationBar.topItem?.title = viewModel.getTitle()
        
        self.navigationController?.navigationBar.backgroundColor = navBarColor
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        self.tableview.layoutIfNeeded()
    }
    // MARK: - Load Data into Tableviw
    private func loadHealthTittle() {
        self.showActivityIndicator()
        viewModel.fetchHealthTittleRows { status in
            DispatchQueue.main.async {
                self.tableview.dataSource = self
                if status == .NetworkError {
                    self.displayNetworkReachabilityAlert()
                }
                self.stopUIOperation()
            }
        }
    }
    
   
}



extension ViewController {
    
    // MARK: - Method to show activity indicator
    private func showActivityIndicator() {
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
    
    // MARK: - Configure refresh control
     func configurePullToRefresh() {
        refreshControl.addTarget(self, action: #selector(ViewController.pullToRefresh), for: .valueChanged)
        self.tableview.insertSubview(refreshControl, at: 0)
        self.tableview.alwaysBounceVertical = true
    }
    
    @objc func pullToRefresh() {
        DispatchQueue.main.async {
            self.loadHealthTittle()
        }
        
    }
    
    // MARK: - Display No Internet Connection Alert
    
    // MARK: - Stop UI Operations
    private func stopUIOperation() {
        self.setNavigationBarTitle()
        self.stopActivityIndicator()
        self.refreshControl.endRefreshing()
        self.tableview.reloadData()
        self.tableview.contentOffset = .zero
    }
   
    
}
