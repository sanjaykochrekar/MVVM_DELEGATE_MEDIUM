//
//  SecondViewController.swift
//  Delegate
//
//  Created by Sanju on 06/11/23.
//

import UIKit



class SecondViewController: UIViewController {
    var countLabel: UILabel!
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // called on cliking "Add 1" button
    @objc func incrementCount() {
        count += 1
        countLabel.text = "\(count)"
    }
    
    
    override func loadView() {
        super.loadView()
        createUI()
    }
    

    private func createUI() {
        
        view.backgroundColor = .white
        
        countLabel = UILabel()
        countLabel.text = "0"
        countLabel.font = .systemFont(ofSize: 50, weight: .bold)
        countLabel.textColor = .black
        
        view.addSubview(countLabel)
        
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        countLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        
        let button = UIButton()
        button.configuration = .filled()
        button.tintColor = .red
        button.setTitle("Add 1", for: .normal)
        button.addTarget(self, action: #selector(incrementCount), for: .touchUpInside)
        
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 40).isActive = true
    
    }
}
