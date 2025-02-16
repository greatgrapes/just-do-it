//
//  Untitled.swift
//  Watch
//
//  Created by grape on 2/15/25.
//

import UIKit

class RegionPickerViewController: UIViewController {
    
    //MARK: - Properties
    let array = ["괌","과테말라 시티","구스타비아","그리트비켄"]
    
    lazy var regionTableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.register(RegionTableViewCell.self, forCellReuseIdentifier: RegionTableViewCell.id)
        table.backgroundColor = .black
        table.separatorStyle = .singleLine
        table.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        table.separatorInsetReference = .fromAutomaticInsets
        table.separatorColor = .gray
        return table
    }()
    

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        makeSearchBar()
        setupUI()
    }

    private func makeSearchBar() {
        // SearchBar 핵심구현부
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "검색"
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        // 색상 설정
        searchController.searchBar.tintColor = .orange
        // 취소키설정
        searchController.searchBar.setValue("취소", forKey: "CancelButtonText")
        searchController.searchBar.showsCancelButton = true
      
        // nav설정
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = searchController
     
        // Title 및 Title 색상 설정
        self.navigationItem.title = "도시 선택"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    //MARK: - UI
    func setupUI() {
        regionTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(regionTableView)
        NSLayoutConstraint.activate([
            regionTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            regionTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            regionTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            regionTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension RegionPickerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RegionTableViewCell.id, for: indexPath) as? RegionTableViewCell else {
            return UITableViewCell()
        }
        
        // indexPath.row를 사용해서 데이터를 전달
        cell.setData(mock: array[indexPath.row])
        return cell
    }
    
}
