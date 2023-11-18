//
//  HealthTitleDesExtensionVC.swift
//  HelathTittleListTask
//
//  Created by Abhay Chaurasia on 18/11/23.
//

import UIKit



extension HealthtittleDesVC {
    
    func setUI() {
        view.backgroundColor = .white

               // Add scrollView
               view.addSubview(scrollView)
               NSLayoutConstraint.activate([
                   scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                   scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                   scrollView.topAnchor.constraint(equalTo: view.topAnchor),
                   scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
               ])

               // Add contentView to scrollView
               scrollView.addSubview(contentView)
               NSLayoutConstraint.activate([
                   contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                   contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                   contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                   contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                   contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
               ])

               // Add topic label to contentView
               contentView.addSubview(topicLabel)
               NSLayoutConstraint.activate([
                   topicLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                   topicLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20)
               ])

               // Add description label to contentView
               contentView.addSubview(descriptionLabel)
               NSLayoutConstraint.activate([
                   descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                   descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                   descriptionLabel.topAnchor.constraint(equalTo: topicLabel.bottomAnchor, constant: 20),
                   descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
               ])
    }
    
    // MARK: - Method to stop activity indicator
   private  func stopActivityIndicator() {
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
    }
       func stopUIOperation() {
        setData()
        self.stopActivityIndicator()
        self.refreshControl.endRefreshing()
    }
}
