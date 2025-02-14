//
//  WorldClockTableViewCell.swift
//  Watch
//
//  Created by grape on 2/14/25.
//

import UIKit

class WorldClockTableViewCell: UITableViewCell {
    
    static let id = "WorldClockTableViewCell"
    
    var verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        return stack
    }()
    
    var currentDateLabel: UILabel = {
        let label = UILabel()
        label.text = "오늘, +0시간"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    var regionLabel: UILabel = {
        let label = UILabel()
        label.text = "서울"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    var clockLabel: UILabel = {
        let label = UILabel()
        label.text = "00:35"
        label.textColor = .white
        label.font = .systemFont(ofSize: 45)
        return label
    }()
    
    
    
    // 초기화 메서드. 스타일과 재사용 식별자를 매개변수로 받아 초기화를 수행함.
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    // 초기화 메서드 (NSCoder를 사용한 초기화). 스토리보드나 xib 파일을 통해 생성된 경우 사용됨.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Nib 파일로부터 객체가 초기화된 후 호출되는 메서드
    override class func awakeFromNib() {
        super.awakeFromNib()
        // 추가적인 초기화 작업을 여기에 작성할 수 있음.
    }
    
    // 셀의 선택 상태가 변경될 때 호출되는 메서드
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // 선택 상태 변경 시 추가 작업을 여기에 작성 할 수 있음.
    }
    
    // setup
    private func setupUI() {
        self.backgroundColor = .black
  
        self.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(currentDateLabel)
        verticalStackView.addArrangedSubview(regionLabel)
        
        self.addSubview(clockLabel)
        
        NSLayoutConstraint.activate([
            verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 17),
            verticalStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            clockLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -17),
            clockLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        clockLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setData() {
        
    }
    
    
}
