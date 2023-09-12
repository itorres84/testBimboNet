//
//  MissionDetailViewController.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 09/09/23.
//

import UIKit

class MissionDetailViewController: UIViewController {
    
    lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "detail.view.title".localized()
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.register(cell: GeneralInfoTableViewCell.self)
        tableView.register(cell: CarrouselTableViewCell.self)
        tableView.register(cell: DescriptionTableViewCell.self)
        tableView.register(cell: LinksTableViewCell.self)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        return tableView
    }()
    
    var sections: [MissionDetailSection] = []
    let viewModel: MissionDetailViewModel
    var coordinator: MissionDetailCoordinator?
    
    init(viewModel: MissionDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        addSubviews()
        addConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        observeViewModel()
        viewModel.getSections()
        title = viewModel.getTitle()
    }
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 16),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func observeViewModel() {
        viewModel.bindSynchronizeViewModelToController = { sections in
            self.sections = sections
            self.tableView.reloadData()
        }
    }
}

extension MissionDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section: MissionDetailSection = sections[indexPath.row]
        switch section {
        case .generalData(let info):
            let cell = tableView.dequeueReusableCell(with: GeneralInfoTableViewCell.self, for: indexPath)
            cell.configure(model: info)
            return cell
        case .carrousel(let images):
            let cell = tableView.dequeueReusableCell(with: CarrouselTableViewCell.self, for: indexPath)
            cell.configure(images: images)
            return cell
        case .description(let info):
            let cell = tableView.dequeueReusableCell(with: DescriptionTableViewCell.self, for: indexPath)
            cell.configure(description: info)
            return cell
        case .links(let info):
            let cell = tableView.dequeueReusableCell(with: LinksTableViewCell.self, for: indexPath)
            cell.configure(link: info)
            cell.delegate = self
            return cell
        }
    }
}

extension MissionDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section: MissionDetailSection = sections[indexPath.row]
        switch section {
        case .generalData(_):
            return 150
        case .carrousel(_):
            return 230
        case .description(_):
            return 200
        case .links(_):
            return 110
        }
    }
}

extension MissionDetailViewController: LinksTableViewCellDelegate {
    
    func openWebView(url: String) {
        coordinator?.openWebView(url: url)
    }
    
    func openYoutube(youTubeID: String) {
        coordinator?.openYouTube(id: youTubeID)
    }
}


