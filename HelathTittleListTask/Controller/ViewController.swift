//
//  ViewController.swift
//  HelathTittleListTask
//
//  Created by Abhay Chaurasia on 17/11/23.
//

import UIKit



class ViewController: UIViewController  {
    
    let tableview  = UITableView()
    private var viewModel = HealthViewModel()
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
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.lightGray
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
    
    // MARK: - Configure Table view
    private func configureTableView() {
        view.addSubview(tableview)
        configurePullToRefresh()
        setTableViewDelegates()
        tableview.rowHeight = UITableView.automaticDimension
        tableview.register(HealthtittleListCell.self, forCellReuseIdentifier: "HealthtittleListCell")
        tableview.pin(to: view)
        tableview.backgroundColor = UIColor.gray
    }
    // MARK: - Set Tableview Delegate
    private func setTableViewDelegates() {
        tableview.delegate = self
        tableview.dataSource = self
    }
}

extension ViewController :  UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HealthtittleListCell") as! HealthtittleListCell
        let row = viewModel.cellForRowAt(indexPath: indexPath)
        cell.set(fact: row)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = HealthtittleDesVC()
        vc.topicID = viewModel.cellForRowAt(indexPath: indexPath).id ?? ""
       
        self.navigationController?.pushViewController( vc, animated: true )
        
        
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
    private func configurePullToRefresh() {
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
    func displayNetworkReachabilityAlert() {
        let alertView = UIAlertController(title: alertTitle, message: alertDescription, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
        })
        alertView.addAction(ok)
        self.present(alertView, animated: true, completion: nil)
    }
}
