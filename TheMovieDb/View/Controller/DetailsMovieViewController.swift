//
//  DetailsMovieViewController.swift
//  TheMovieDb
//
//  Created by Admin on 08/05/22.
//

import UIKit

class DetailsMovieViewController: UIViewController {
  
    private var detailsMovieViewScreen : DetailsMoviesScreen?
    public var imageData : Data?
    public var originalTitle : String?
    public var overview : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.detailsMovieViewScreen?.delegate = self
    }
    
    override func loadView() {
        self.detailsMovieViewScreen = DetailsMoviesScreen()
        self.view = self.detailsMovieViewScreen
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.detailsMovieViewScreen?.imageBackDropPath.image = UIImage(data: self.imageData!)
        self.detailsMovieViewScreen?.labelOriginalTitle.text = self.originalTitle
        self.detailsMovieViewScreen?.labelOverview.text = self.overview
    }
}

extension DetailsMovieViewController : DetailsMoviesScreenProtocol{
    func backButton() {
        self.navigationController?.popViewController(animated: true)
    }
}
    
