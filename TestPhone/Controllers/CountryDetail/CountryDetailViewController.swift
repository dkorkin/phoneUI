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
        tableView.register(ScrollableHeaderView.self)
        tableView.register(SubscriptionTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        UIView.animate(withDuration: 0.25) {
            UIApplication.shared.statusBarColor = .blue
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
        cell.subscriptionViews = self.createSubscriptions()
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
        view.delegate = self
        return view
    }
}

extension CountryDetailViewController {
    private func createSubscriptions() -> [SubscriptionView] {
        let models = self.createModels()
        let view1: SubscriptionView = UINib.instantiate()
        view1.model = models[0]
        let view2: SubscriptionView = UINib.instantiate()
        view2.model = models[1]
        let view3: SubscriptionView = UINib.instantiate()
        view3.model = models[2]
        return [view1, view2, view3]
    }
    
    private func createModels() -> [Subscription] {
        let model1 = Subscription(count: "3", period: "months", price: "$29.99")
        let model2 = Subscription(
            isMostPopular: true,
            count: "3-Day",
            period: "trial",
            price: "$7.99",
            additionalPrice: "/wk"
        )
        let model3 = Subscription(count: "12", period: "months", price: "$59.99")
        return [model1, model2, model3]
    }
}

extension CountryDetailViewController: ScrollableHeaderViewDelegate {
    func cancelButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
