//
//  NewsTableViewCell.swift
//  O-Logo_MP
//
//  Created by Petrykevich, Kanstantsin on 12.05.22.
//

import Foundation
import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    // MARK: - Lifecycle method's
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: cellInsets)
    }
    
    // MARK: - Helper method's
    func configure(title: String, subtitle: String, imageURL: URL?) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        cardImageView.kf.setImage(with: imageURL)
    }
    
}

// MARK: - Private
extension NewsTableViewCell {
    
    // Properties
    var cellInsets: UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 10, right: 18)
    }
    
    // Method's
    func setupUI() {
        setupLabels()
        setupContentView()
    }
    
    func setupLabels() {
        titleLabel.font = .semiBold(withSize: 15)
        titleLabel.textColor = .black
        subtitleLabel.font = .regular(withSize: 12)
        subtitleLabel.textColor = .black
    }
    
    func setupContentView() {
        self.contentView.setShadow(offset:  CGSize(width: 0, height: 5), radius: 0, opacity: 0.1)
    }
}
