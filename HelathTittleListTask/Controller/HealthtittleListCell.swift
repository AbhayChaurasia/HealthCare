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
    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//    //    self.contentView.addSubview(imgView)
//      //  containerView.addSubview(title)
//       // containerView.addSubview(descriptionText)
//        self.contentView.addSubview(title)
//
////        configureImageView()
//      //  configureContainerView()
//        configureTitleLabel()
////        configureDesciptionLabel()
////
////        setImageConstraints()
////        setContainerViewConstraints()
//        setTitleLabelConstraints()
//      //  setDescriptionLabelConstraints()
//
//        self.layoutIfNeeded()
//
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // Create and configure the title label
        title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(title)
        title.numberOfLines = 0  // Allow multiple lines
         // Set up constraints for the title label (adjust as needed)
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
     //   descriptionText.text = fact.description
        
    //    guard let imageHref = fact.imageHref else {return}
    //    urlString = imageHref

        // clear old image before downloading new
      //  self.imgView.image = nil

        //Async download images and cache the downloaded images
//       imgView.loadImageFrom(urlString: urlString, completionHandler: { image in
//        DispatchQueue.main.async {
//            self.imgView.image = image
//        }
//        })
    }

    // MARK: - Configure Image View
//    private func configureImageView() {
//        imgView.contentMode = .scaleAspectFit
//        imgView.layer.cornerRadius = 10
//        imgView.clipsToBounds = true
//    }
    
    // MARK: - Configure Container View
//    private func configureContainerView() {
//        containerView.translatesAutoresizingMaskIntoConstraints = false
//        containerView.clipsToBounds = true
//    }
    
    // MARK: - Configure Title Label
    private func configureTitleLabel() {
        title.numberOfLines = 0
        title.adjustsFontSizeToFitWidth = true
        title.adjustsFontForContentSizeCategory = true
        title.font = UIFont.boldSystemFont(ofSize: 20)
        title.textColor = UIColor.black
    }
    
    // MARK: - Configure Description Label
    private func configureDesciptionLabel() {
        descriptionText.numberOfLines = 0
        descriptionText.minimumScaleFactor = 10.0
        descriptionText.adjustsFontSizeToFitWidth = true
        descriptionText.adjustsFontForContentSizeCategory = true
        descriptionText.font = UIFont.systemFont(ofSize: 14)
        descriptionText.textColor = UIColor.darkGray
    }
    
    // MARK: - Set Image Constraints
//    private func setImageConstraints() {
//        imgView.translatesAutoresizingMaskIntoConstraints = false
//        imgView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
//        imgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
//        imgView.heightAnchor.constraint(equalToConstant: 60).isActive = true
//        imgView.widthAnchor.constraint(equalTo: imgView.heightAnchor, multiplier: 16/9).isActive = true
//
//    }

    // MARK: - Set Container View Constraints
//    private func setContainerViewConstraints() {
//        containerView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
//        containerView.leadingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 10).isActive = true
//        containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
//    }
    
    // MARK: - Set Title Label Constraints
    private func setTitleLabelConstraints() {
//        title.translatesAutoresizingMaskIntoConstraints = false
//        title.topAnchor.constraint(equalTo: self.containerView.topAnchor).isActive = true
//        title.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
//        title.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor).isActive = true
//        title.firstBaselineAnchor.constraint(equalToSystemSpacingBelow: contentView.layoutMarginsGuide.topAnchor, multiplier: 1).isActive = true
//      //  contentView.layoutMarginsGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: descriptionText.lastBaselineAnchor, multiplier: 1).isActive = true
        
        
        
        
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    // MARK: - Set Description Label Constraints
    private func setDescriptionLabelConstraints() {
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        descriptionText.topAnchor.constraint(equalTo: self.title.bottomAnchor).isActive = true
        descriptionText.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
        descriptionText.trailingAnchor.constraint(equalTo: title.trailingAnchor).isActive = true
    }
}
class CustomTableViewCell: UITableViewCell {
    var titleLabel: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // Create and configure the title label
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)

        // Set up constraints for the title label (adjust as needed)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
