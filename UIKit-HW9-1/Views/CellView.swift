//
//  CellView.swift
//  UIKit-HW9-1
//
//  Created by Дима on 12/15/24.
//

import UIKit

class CellView: UICollectionViewCell {
    static let identifier = "CellView"
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(cardView)
        cardView.addSubviews(profileImageView, authorNameLabel, posterImageView, headerLabel, dateLabel, postTextLabel)
    }
    
    func configure(with content: Content) {
        profileImageView.image = UIImage(named: content.profileImageName)
        authorNameLabel.text = content.authorNameText
        posterImageView.image = UIImage(named: content.posterImageName)
        headerLabel.text = content.headerText
        dateLabel.text = content.date
        postTextLabel.text = content.descriptionText
        
        setupConstraints()
    }

    private let screenWidth = UIScreen.main.bounds.width

    private lazy var cardView = {
        $0.layer.cornerRadius = 20
        $0.backgroundColor = ColorScheme.background.value()
        return $0
    }(UIView())
    
    private lazy var profileImageView = setupImageView(radius: 25)
    private lazy var authorNameLabel = UILabel().setupLabel(textStyle: .header)
    private lazy var posterImageView = setupImageView(radius: 20)
    private lazy var headerLabel = UILabel().setupLabel(textStyle: .header)
    private lazy var dateLabel = UILabel().setupLabel(textStyle: .subDescription)
    private lazy var postTextLabel = UILabel().setupLabel(textStyle: .description)
    
    private func setupImageView(radius: CGFloat) -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = radius
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
    private func setupConstraints() {
        activateConstraints(cardView, profileImageView, authorNameLabel, posterImageView, headerLabel, dateLabel, postTextLabel)
        
        let imageRatio = posterImageView.image?.getRatio() ?? 0
        let imageHeight = imageRatio * screenWidth
        
        NSLayoutConstraint.activate([
            // base
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            cardView.widthAnchor.constraint(equalToConstant: screenWidth - 2 * Margins.large.value()),
            
            profileImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: Margins.medium.value()),
            profileImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: Margins.medium.value()),
            profileImageView.widthAnchor.constraint(equalToConstant: 50),
            profileImageView.heightAnchor.constraint(equalToConstant: 50),
            
            authorNameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: Margins.medium.value()),
            authorNameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            authorNameLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -Margins.medium.value()),
            
            posterImageView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: Margins.medium.value()),
            posterImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: Margins.medium.value()),
            posterImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -Margins.medium.value()),
            posterImageView.heightAnchor.constraint(equalToConstant: imageHeight),
            
            headerLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: Margins.medium.value()),
            headerLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: Margins.medium.value()),
            headerLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -Margins.medium.value()),
            
            dateLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: Margins.medium.value()),
            dateLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: Margins.medium.value()),
            dateLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -Margins.medium.value()),
            
            postTextLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: Margins.medium.value()),
            postTextLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: Margins.medium.value()),
            postTextLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -Margins.medium.value()),
            
            cardView.bottomAnchor.constraint(equalTo: postTextLabel.bottomAnchor, constant: Margins.medium.value())
            
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
