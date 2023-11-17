//
//  HealthtittleListCell.swift
//  HelathTittleListTask
//
//  Created by Abhay Chaurasia on 17/11/23.
//

import UIKit



class HealthtittleListCell: UITableViewCell {
    
    var title = UILabel()
    var descriptionText = UILabel()
    var containerView = UIView()
    private var urlString: String = ""
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Create and configure the title label
        title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(title)
        title.numberOfLines = 0  // Allow multiple lines
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        self.layoutIfNeeded()
    }
    
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.title.text = nil
        self.descriptionText.text = nil
        //     self.imgView.image = nil
    }
    
    // MARK: - Configure Cell
    func set(fact: Item) {
        title.text = fact.title
        
    }
    
  
    
}
 
