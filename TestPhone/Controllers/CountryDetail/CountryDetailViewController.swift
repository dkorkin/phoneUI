//
//  ViewController.swift
//  TestPhone
//
//  Created by Dmitriy Korkin on 30/04/2019.
//  Copyright © 2019 Dmitriy Korkin. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController {
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: UIScreen.main.bounds.size), style: .grouped)
        tableView.separatorStyle = .none
        tableView.register(ScrollableHeaderView.self)
        tableView.register(SubscriptionTableViewCell.self)
        tableView.register(TableFooterView.self)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    var country: Country? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        UIView.animate(withDuration: 0.25) {
            UIApplication.shared.statusBarColor = Colors.appDarkBlue
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
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
        return 180
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 400
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view: ScrollableHeaderView = tableView.dequeueHeaderReusableCell()
        view.models = country?.phones
        view.delegate = self
        return view
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view: TableFooterView = tableView.dequeueHeaderReusableCell()
        view.delegate = self
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 185
    }
}

extension CountryDetailViewController: ScrollableHeaderViewDelegate {
    func cancelButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension CountryDetailViewController: TableFooterViewDelegate {
    func activateButtonTapped() {
        self.alert(text: "Activate button tapped")
    }
    
    func termsButtonTapped() {
        self.alert(text: "Terms button tapped")
    }
    
    func policyButtonTapped() {
        self.alert(text: "Privacy policy button tapped")
    }
    
    func restoreButtonTapped() {
        self.alert(text: "Restore button tapped")
    }
    
    private func alert(text: String) {
        let alert = UIAlertController(title: "Alert", message: text, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
