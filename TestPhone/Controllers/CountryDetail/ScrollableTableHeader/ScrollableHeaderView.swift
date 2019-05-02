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

class ScrollableHeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet{
            self.scrollView.delegate = self
        }
    }
    
    var models: [Phone]? = [] {
        didSet {
            self.configureView()
        }
    }
    
    var slides: [SlideView] = []
    
    weak var delegate: ScrollableHeaderViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.delegate?.cancelButtonTapped()
    }
    
    private func configureView() {
        self.createSlides()
        self.setupSlideScrollView()
        self.configurePageControl()
    }
    
    private func createSlides() {
        for model in self.models ?? [] {
            let slide: SlideView = UINib.instantiate()
            slide.phone = model
            self.slides.append(slide)
        }
    }
    
    private func configurePageControl() {
        self.pageControl.numberOfPages = self.models?.count ?? 0
        self.pageControl.currentPage = 0
        self.bringSubviewToFront(self.pageControl)
        self.bringSubviewToFront(self.cancelButton)
    }
    
    private func setupCancelButton() {
        self.cancelButton.tintColor = .white
    }
    
    private func setupSlideScrollView() {
        let width = UIScreen.main.bounds.width
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.height)
        self.scrollView.contentSize = CGSize(width: width * CGFloat(self.slides.count), height: self.frame.height)
        self.scrollView.isPagingEnabled = true
        for i in 0 ..< self.slides.count {
            self.slides[i].frame = CGRect(x: width * CGFloat(i), y: 0, width: width, height: self.frame.height)
            self.scrollView.addSubview(self.slides[i])
        }
    }
}

extension ScrollableHeaderView: UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.hideWithAnimation(true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/scrollView.frame.width)
        self.pageControl.currentPage = Int(pageIndex)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.hideWithAnimation(false)
    }
    
    private func hideWithAnimation(_ hidden: Bool) {
        UIView.animate(withDuration: 0.2) {
            self.cancelButton.isHidden = hidden
        }
    }
}
