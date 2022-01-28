//
//  DiceeViewController.swift
//  Dicee_NoSB
//
//  Created by Raúl Pavón on 28/01/22.
//

import UIKit

class DiceeViewController: UIViewController {
    
    weak var diceeCoordinator: DiceeCoordinator?
    private let factory: DiceeFactory
    
    private lazy var diceeUIView: DiceeUIView = {
        let view = DiceeUIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    required init(factory: DiceeFactory, diceeCoordinator: DiceeCoordinator) {
        self.factory = factory
        self.diceeCoordinator = diceeCoordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        initComponents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func initComponents() {
        addComponents()
        setAutolayout()
        addTarget()
    }
    
    private func addComponents() {
        view.addSubview(diceeUIView)
    }
    
    private func setAutolayout() {
        NSLayoutConstraint.activate([
            diceeUIView.topAnchor.constraint(equalTo: view.topAnchor),
            diceeUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            diceeUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            diceeUIView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func addTarget() {
        diceeUIView.setBtRollTarget(target: self, action: #selector(didTapRoll))
    }
    
    @objc func didTapRoll() {
        diceeUIView.didTapRoll()
    }
}
