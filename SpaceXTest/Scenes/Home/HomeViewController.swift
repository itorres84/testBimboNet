//
//  HomeViewController.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 08/09/23.
//

import UIKit

class HomeViewController: UIViewController {

    struct Dimensions {
        static let heigthAnchorTitleLabel: CGFloat = 60
        static let leadingSpace: CGFloat = 16
        static let trailingSpace: CGFloat = 16
    }
    
    lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(cell: MissionTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        return tableView
    }()
    
    lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "home.view.title".localized()
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        return label
    }()
    
    let viewModel: HomeViewModel
    var missions: [Mission] = []
    var coordinator: HomeCoordinator?
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        addSubviews()
        addConstrainst()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeViewModel()
        title = "Space X 🚀"
        view.backgroundColor = .white
    }
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)
    }
    
    private func addConstrainst() {
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo:  view.layoutMarginsGuide.topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Dimensions.leadingSpace),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -Dimensions.trailingSpace),
            titleLabel.heightAnchor.constraint(equalToConstant: Dimensions.heigthAnchorTitleLabel)
        ])
    
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -Dimensions.trailingSpace),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Dimensions.leadingSpace),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func observeViewModel() {
        viewModel.bindSynchronizeViewModelToController = { [weak self] missions in
            self?.missions = missions
            self?.tableView.reloadData()
        }
        viewModel.fetchMisions()
    }
    
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: MissionTableViewCell.self, for: indexPath)
        cell.configure(mission: missions[indexPath.row])
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.openDeatil(mission: missions[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
