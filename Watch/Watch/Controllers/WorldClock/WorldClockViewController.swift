//
//  Untitled.swift
//  Watch
//
//  Created by grape on 2/14/25.
//

import UIKit

final class WorldClockViewController: UIViewController {
    
    private let viewModel = WorldClockViewModel()
    
    lazy var editButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "편집", style: .plain, target: self, action: #selector(editButtonTapped))
        button.tintColor = .orange
        return button
    }()
    
    lazy var plusButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: .add, style: .plain, target: self, action: #selector(plusButtonTapped))
        button.tintColor = .orange
        return button
    }()
    
    
    lazy var worldClockTableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.register(WorldClockTableViewCell.self, forCellReuseIdentifier: WorldClockTableViewCell.id)
        table.backgroundColor = .black
        return table
    }()
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setupUI()
    }
    
    // MARK: UI
    
    func setupNav() {
        // 기본 설정
        view.backgroundColor = .black
        title = "세계 시계"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .white
        // 네비게이션 바 배경색 설정 (큰 타이틀 모드)
        navigationController?.navigationBar.standardAppearance = navBarAppearance()
        // 네비게이션 바 배경색 설정 (작은 타이틀 모드)
        navigationController?.navigationBar.compactAppearance = navBarAppearance()
        
        self.navigationItem.leftBarButtonItem = editButton
        self.navigationItem.rightBarButtonItem = plusButton
    }
    
    func setupUI() {
        worldClockTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(worldClockTableView)
        NSLayoutConstraint.activate([
            worldClockTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            worldClockTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            worldClockTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            worldClockTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func navBarAppearance() -> UINavigationBarAppearance {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .black
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        return navBarAppearance
    }
    
    

    
    // MARK: - Helpers
    @objc func editButtonTapped() {
        print(#function)
    }
    
    @objc func plusButtonTapped() {
        print(#function)
      //TODO: 도시선택 바텀시트 검색창구현
        let regionPickerVC = RegionPickerViewController(viewModel: viewModel)
        present(regionPickerVC, animated: true)
    }
    
    // ViewModel에서 데이터가 변경되면 테이블뷰 리로드
    func didUpdateRegions() {
        worldClockTableView.reloadData()
    }
    
    
}

extension WorldClockViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WorldClockTableViewCell.id, for: indexPath) as? WorldClockTableViewCell else { return UITableViewCell() }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}
