//
//  ViewController.swift
//  TestPhone
//
//  Created by Dmitriy Korkin on 30/04/2019.
//  Copyright © 2019 Dmitriy Korkin. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController {
    
    var headerView: ScrollableHeaderView = UINib.instantiate()
    
    lazy var fakeFooterView: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .white
        return view
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: UIScreen.main.bounds.size), style: .plain)
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.register(SubscriptionTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    var country: Country? {
        didSet {
            self.headerView.models = country?.phones
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 0)
        self.view.backgroundColor = Colors.appDarkBlue
        self.view.addSubview(self.fakeFooterView)
        self.view.addSubview(self.tableView)
        
        let footerView: TableFooterView = UINib.instantiate()
        footerView.delegate = self
        self.tableView.tableFooterView = footerView
        
        self.tableView.tableHeaderView = self.headerView
        self.headerView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        UIView.animate(withDuration: 0.25) {
            UIApplication.shared.statusBarColor = Colors.appDarkBlue
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        UIView.animate(withDuration: 0.25) {
            UIApplication.shared.statusBarColor = .white
        }
    }
}

extension CountryDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SubscriptionTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.subscriptions = self.country?.subscriptions
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
}

extension CountryDetailViewController: ScrollableHeaderViewDelegate {
    func cancelButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension CountryDetailViewController: TableFooterViewDelegate {
    func activateButtonTapped() {
        print("Activate button tapped")
    }
    
    func termsButtonTapped() {
        print("Terms button tapped")
    }
    
    func policyButtonTapped() {
        print("Privacy policy button tapped")
    }
    
    func restoreButtonTapped() {
        print("Restore button tapped")
    }
}

extension CountryDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = CGFloat(self.tableView.contentSize.height) - CGFloat(UIScreen.main.bounds.height)
        if (scrollView.contentOffset.y > offset) {
            let height = scrollView.contentOffset.y - offset
            self.fakeFooterView.frame = CGRect.init(x: 0, y: UIScreen.main.bounds.height - height, width: UIScreen.main.bounds.width, height: height)
        }
    }
}
