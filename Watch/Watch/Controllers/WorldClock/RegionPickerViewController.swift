//
//  Untitled.swift
//  Watch
//
//  Created by grape on 2/15/25.
//

import UIKit

class RegionPickerViewController: UIViewController {
    
    //MARK: - Properties
    //TODO 추후 데이터관리
    let cities = [
        ("괌", "괌"),
        ("과테말라 시티", "과테말라"),
        ("구스타비아", "생 바르텔레미"),
        ("그리트비켄", "사우스 조지아 및 사우스 샌드위치 제도"),
        ("뉴욕", "미국"),
        ("런던", "영국"),
        ("파리", "프랑스"),
        ("도쿄", "일본"),
        ("베를린", "독일"),
        ("시드니", "호주"),
        ("상파울루", "브라질"),
        ("케이프타운", "남아프리카 공화국"),
        ("모스크바", "러시아"),
        ("서울", "대한민국"),
        ("베이징", "중국"),
        ("방콕", "태국"),
        ("마닐라", "필리핀"),
        ("두바이", "아랍에미리트"),
        ("싱가포르", "싱가포르"),
        ("토론토", "캐나다")
    ]
    
    let hangulInitialList = [
        "ㄱ", "ㄲ", "ㄴ", "ㄷ", "ㄸ", "ㄹ", "ㅁ", "ㅂ", "ㅃ", "ㅅ",
        "ㅆ", "ㅇ", "ㅈ", "ㅉ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"
    ]
    
    var groupedCities: [String: [(String, String)]] = [:]
    var sectionTitles: [String] = []

    lazy var regionTableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.register(RegionTableViewCell.self, forCellReuseIdentifier: RegionTableViewCell.id)
        table.backgroundColor = .modal
        table.separatorStyle = .singleLine
        table.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        table.separatorInsetReference = .fromAutomaticInsets
        table.separatorColor = .white
        table.sectionIndexColor = .orange
        return table
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .modal
        makeSearchBar()
        setupUI()
        groupCitiesByInitial()
    }
    
    private func groupCitiesByInitial() {
        groupedCities.removeAll()
        
        for city in cities {
            let initial = getInitialConsonant(city.0.first!)
            if groupedCities[initial] == nil {
                groupedCities[initial] = []
            }
            groupedCities[initial]?.append(city)
        }
        
        sectionTitles = groupedCities.keys.sorted()
    }
    
    private func makeSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.backgroundImage = UIImage()
        searchController.searchBar.sizeToFit()
        searchController.searchBar.placeholder = "검색"
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.tintColor = .orange
        searchController.searchBar.setValue("취소", forKey: "CancelButtonText")
        searchController.searchBar.showsCancelButton = true
        
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = searchController
        
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
    
    //MARK: - Helpers
    private func isKoreanCharacter(_ character: Character) -> Bool {
        guard let scalar = character.unicodeScalars.first else { return false }
        return (UnicodeScalar("가")...UnicodeScalar("힣")).contains(scalar)
    }
    
    private func getInitialConsonant(_ character: Character) -> String {
        if !isKoreanCharacter(character) {
            return character.uppercased()
        }

        let hangulBase: UInt32 = 44032 // "가"의 유니코드 값
        let unicodeScalar = character.unicodeScalars.first!
        let value = unicodeScalar.value - hangulBase

        let initialList = hangulInitialList
        let index = Int(value / 588) // 초성 인덱스 가져오기

        return initialList[index]
    }
}

//MARK: - UITableView Delegate & DataSource
extension RegionPickerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = .lightGray
            headerView.contentView.backgroundColor = UIColor(named: "ModalColor")
         }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = sectionTitles[section]
        return groupedCities[key]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RegionTableViewCell.id, for: indexPath) as? RegionTableViewCell else {
            return UITableViewCell()
        }
        
        let sectionKey = sectionTitles[indexPath.section]
        if let cityList = groupedCities[sectionKey] {
            let city = cityList[indexPath.row].0
            let country = cityList[indexPath.row].1
            cell.setData(city: city, country: country)
        }
        
        
        
        return cell
    }
    
    // 섹션 인덱스 (오른쪽 ㄱㄴㄷㄹ 인덱스 표시)
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionTitles
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return sectionTitles.firstIndex(of: title) ?? 0
    }
}
