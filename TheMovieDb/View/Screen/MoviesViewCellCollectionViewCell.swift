//
//  MoviesViewCellCollectionViewCell.swift
//  TheMovieDb
//
//  Created by Admin on 01/05/22.
//

import UIKit

class MoviesViewCellCollectionViewCell: UICollectionViewCell {
    
    public let identifier = "MoviesViewCellCollectionViewCell"
    
    lazy var imagePosterPath : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubView()
        self.configImagePosterPathConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubView(){
        self.contentView.addSubview(self.imagePosterPath)
    }
    
    private func configImagePosterPathConstraints(){
        NSLayoutConstraint.activate([
            self.imagePosterPath.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.imagePosterPath.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.imagePosterPath.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.imagePosterPath.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.imagePosterPath.widthAnchor.constraint(equalToConstant: 130),
            self.imagePosterPath.heightAnchor.constraint(equalToConstant: 130)
        ])
    }
}
