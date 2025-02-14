//
//  Untitled.swift
//  Watch
//
//  Created by grape on 2/15/25.
//

import UIKit

class RegionPickerViewController: UIViewController {
    
    private let viewModel: WorldClockViewModel
    
    private let regions = [
        Region(name: "서울", timezone: "GMT+9"),
        Region(name: "뉴욕", timezone: "GMT-5"),
        Region(name: "런던", timezone: "GMT+0")
    ]

    init(viewModel: WorldClockViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
    }

    private func setupUI() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)

        regions.forEach { region in
            let button = UIButton(type: .system)
            button.setTitle(region.name, for: .normal)
            button.addTarget(self, action: #selector(regionSelected(_:)), for: .touchUpInside)
            button.tag = regions.firstIndex(where: { $0.name == region.name }) ?? 0
            stackView.addArrangedSubview(button)
        }

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc private func regionSelected(_ sender: UIButton) {
        let selectedRegion = regions[sender.tag]
        viewModel.addRegion(selectedRegion)
        dismiss(animated: true)
    }
}
