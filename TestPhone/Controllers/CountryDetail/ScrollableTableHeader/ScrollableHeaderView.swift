//
//  ScrollableHeaderView.swift
//  TestPhone
//
//  Created by Dmitriy Korkin on 30/04/2019.
//  Copyright © 2019 Dmitriy Korkin. All rights reserved.
//

import UIKit

protocol ScrollableHeaderViewDelegate: class {
    func cancelButtonTapped()
}

class ScrollableHeaderView: UIView {
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet var collectionView: UICollectionView!
    
    var models: [Phone]? = [] {
        didSet {
            self.configurePageControl()
            self.collectionView.reloadData()
        }
    }
    
    var slides: [SlideViewCell] = []
    
    weak var delegate: ScrollableHeaderViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureView()
    }
    
    private func configureView() {
        self.configureCollection()
        self.createGradientLayer()
    }
    
    private func configureCollection() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets.zero
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize.init(width: UIScreen.main.bounds.width, height: 400)
        self.collectionView.setCollectionViewLayout(layout, animated: false)
        self.collectionView.backgroundColor = .clear
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.isPagingEnabled = true
        self.collectionView.register(UINib(nibName: "SlideViewCell", bundle: nil), forCellWithReuseIdentifier: "SlideViewCell")
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.showsVerticalScrollIndicator = false
    }
    
    func createGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [Colors.appDarkBlue.cgColor, Colors.appBlue.cgColor]
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func configurePageControl() {
        self.pageControl.numberOfPages = self.models?.count ?? 0
        self.pageControl.currentPage = 0
    }
    
    private func setupCancelButton() {
        self.cancelButton.tintColor = .white
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.delegate?.cancelButtonTapped()
    }
}


extension ScrollableHeaderView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.models?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SlideViewCell", for: indexPath) as! SlideViewCell
        cell.phone = self.models?[indexPath.row]
        return cell
    }
}


extension ScrollableHeaderView: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageIndex = round(self.collectionView.contentOffset.x/self.collectionView.frame.width)
        self.pageControl.currentPage = Int(pageIndex)
    }
}
