//
//  NewsTableViewCell.swift
//  O-Logo_MP
//
//  Created by Petrykevich, Kanstantsin on 12.05.22.
//

import Foundation
import UIKit

class NewsTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    // MARK: - Properties
    
    // MARK: - Lifecycle method's
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    // MARK: - Helper method's
    func configure(title: String, subtitle: String, image: UIImage?) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        cardImageView.image = image ?? UIImage(named: "card_sample")
    }
    
}

// MARK: - Private
extension NewsTableViewCell {
    
    // Method's
    func setupUI() {
        setupLabels()
        setupCardView()
    }
    
    func setupLabels() {
        titleLabel.font = .semiBold(withSize: 15)
        titleLabel.textColor = .black
        subtitleLabel.font = .regular(withSize: 12)
        subtitleLabel.textColor = .black
        cardImageView.image = UIImage(named: "card_sample")
    }
    
    func setupCardView() {
        cardView.setShadow(offset:  CGSize(width: 0, height: 10), radius: 4, opacity: 0.2)
    }
}
