//
//  ViewControllerExtension.swift
//  HelathTittleListTask
//
//  Created by Abhay Chaurasia on 18/11/23.
//

import UIKit

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
    
    
    // MARK: - Configure Table view
     func configureTableView() {
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
    
    func displayNetworkReachabilityAlert() {
        let alertView = UIAlertController(title: alertTitle, message: alertDescription, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
        })
        alertView.addAction(ok)
        self.present(alertView, animated: true, completion: nil)
    }
    
}
