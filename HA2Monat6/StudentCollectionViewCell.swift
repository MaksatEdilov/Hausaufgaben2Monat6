//
//  StudentViewController.swift
//  HA2Monat6
//
//  Created by Maksat Edil on 8/1/24.
//

import UIKit

class StudentCollectionViewCell: UICollectionViewCell {
    var studentNameLabel: UILabel!
    var studentSurnameLabel: UILabel!
    var studentImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        studentImageView = UIImageView()
        studentImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(studentImageView)
        
        studentNameLabel = UILabel()
        studentNameLabel.translatesAutoresizingMaskIntoConstraints = false
        studentNameLabel.numberOfLines = 0
        studentNameLabel.font = .systemFont(ofSize: 12)
        addSubview(studentNameLabel)
        
        studentSurnameLabel = UILabel()
        studentSurnameLabel.translatesAutoresizingMaskIntoConstraints = false
        studentSurnameLabel.numberOfLines = 0 
        studentSurnameLabel.font = .systemFont(ofSize: 12)
        addSubview(studentSurnameLabel)
        
        NSLayoutConstraint.activate([
            studentImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            studentImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            studentImageView.widthAnchor.constraint(equalToConstant: 80),
            studentImageView.heightAnchor.constraint(equalToConstant: 80),
            
            studentNameLabel.topAnchor.constraint(equalTo: studentImageView.bottomAnchor, constant: 8),
            studentNameLabel.leadingAnchor.constraint(equalTo: studentImageView.leadingAnchor),
            studentNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            studentSurnameLabel.topAnchor.constraint(equalTo: studentNameLabel.bottomAnchor, constant: 4),
            studentSurnameLabel.leadingAnchor.constraint(equalTo: studentImageView.leadingAnchor),
            studentSurnameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
