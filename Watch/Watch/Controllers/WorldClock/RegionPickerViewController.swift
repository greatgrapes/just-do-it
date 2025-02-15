//
//  Untitled.swift
//  Watch
//
//  Created by grape on 2/15/25.
//

import UIKit

class RegionPickerViewController: UIViewController {
    
    //MARK: - Properties

    

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        makeSearchBar()
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
}
