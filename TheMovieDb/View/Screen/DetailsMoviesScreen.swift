//
//  DetailsMoviesScreen.swift
//  TheMovieDb
//
//  Created by Admin on 08/05/22.
//

import UIKit

protocol DetailsMoviesScreenProtocol {
    func backButton()
}

class DetailsMoviesScreen: UIView {
    
    var delegate: DetailsMoviesScreenProtocol?
    
    lazy var scrollView : UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    lazy var view : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var buttonBack : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "backbutton"), for: .normal)
        button.addTarget(self, action: #selector(self.backButton), for: .touchUpInside)
        return button
    }()
    
    lazy var imageBackDropPath : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var labelOriginalTitle : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "Arial", size: 25)
        label.numberOfLines = 3
        return label
    }()
    
    lazy var labelOverview : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "Arial", size: 18)
        label.numberOfLines = 25
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        self.addSubView()
        self.configButtonBackConstraints()
        self.configImageBackDropConstraints()
        self.configLabelOriginalTitleConstraints()
        self.configScrollView()
        self.configLabelOverViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubView(){
        self.addSubview(self.imageBackDropPath)
        self.addSubview(self.scrollView)
        self.addSubview(self.labelOriginalTitle)
        self.addSubview(self.labelOverview)
        self.addSubview(self.buttonBack)
    }
    
    private func configButtonBackConstraints(){
        NSLayoutConstraint.activate([
            self.buttonBack.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            self.buttonBack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5)
        ])
    }
    
    private func configImageBackDropConstraints(){
        NSLayoutConstraint.activate([
            self.imageBackDropPath.topAnchor.constraint(equalTo: self.buttonBack.bottomAnchor, constant: 20),
            self.imageBackDropPath.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
    private func configLabelOriginalTitleConstraints(){
        NSLayoutConstraint.activate([
            self.labelOriginalTitle.topAnchor.constraint(equalTo: self.imageBackDropPath.bottomAnchor, constant: 20),
            self.labelOriginalTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.labelOriginalTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.labelOriginalTitle.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func configScrollViewConstraints(){
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.labelOriginalTitle.bottomAnchor, constant: 5),
            self.scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func configViewConstraints(){
        NSLayoutConstraint.activate([
            self.view.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.view.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            self.view.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.view.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            self.view.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
    
    private func configLabelOverViewConstraints(){
        NSLayoutConstraint.activate([
            self.labelOverview.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 5),
            self.labelOverview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            self.labelOverview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            self.labelOverview.heightAnchor.constraint(equalToConstant: 600)
        ])
    }
    
    private func configScrollView(){
        self.scrollView.addSubview(self.view)
        self.configViewConstraints()
        self.configScrollViewConstraints()
        self.view.addSubview(self.labelOverview)
    }
    
    @objc func backButton(){
        self.delegate?.backButton()
    }
}
