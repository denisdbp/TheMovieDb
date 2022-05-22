//
//  MoviesViewScreen.swift
//  TheMovieDb
//
//  Created by Admin on 28/04/22.
//

import UIKit

protocol MovieViewScreenProtocol {
    func searchMovie(movie: String)
}

class MoviesViewScreen: UIView {
    
    var delegate:MovieViewScreenProtocol?
    
    lazy var searchMovieTextField:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.font = UIFont.systemFont(ofSize: 25)
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 6.0
        textField.placeholder = " Pesquisar filme"
        textField.addTarget(self, action: #selector(self.movieSearch), for: .editingChanged)
        return textField
    }()
    
    lazy var moviesCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .black
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        collectionView.setCollectionViewLayout(layout, animated: false)
        collectionView.register(MoviesViewCellCollectionViewCell.self, forCellWithReuseIdentifier: MoviesViewCellCollectionViewCell().identifier)
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubView()
        self.configSearchMovieTextFieldConstraints()
        self.configMoviesCollectionViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubView(){
        self.addSubview(self.searchMovieTextField)
        self.addSubview(self.moviesCollectionView)
    }
    
    @objc func movieSearch(){
        guard let movie = searchMovieTextField.text else {return}
        self.delegate?.searchMovie(movie: movie)
    }
    
    public func textFieldDelegate(delegate: UITextFieldDelegate){
        self.searchMovieTextField.delegate = delegate
    }
    
    private func configSearchMovieTextFieldConstraints(){
        NSLayoutConstraint.activate([
            self.searchMovieTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
            self.searchMovieTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.searchMovieTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.searchMovieTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configMoviesCollectionViewConstraints(){
        NSLayoutConstraint.activate([
            self.moviesCollectionView.topAnchor.constraint(equalTo: self.searchMovieTextField.bottomAnchor, constant: 10),
            self.moviesCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.moviesCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.moviesCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    public func configCollectionView(delegate : UICollectionViewDelegate, dataSource: UICollectionViewDataSource, delegateFlowLayout: UICollectionViewDelegateFlowLayout){
        self.moviesCollectionView.delegate = delegate
        self.moviesCollectionView.dataSource = dataSource
    }
}
