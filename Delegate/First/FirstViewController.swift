//
//  FirstViewController.swift
//  Delegate
//
//  Created by Sanju on 06/11/23.
//

import UIKit



class FirstViewController: UIViewController {

    override func loadView() {
        super.loadView()
        createUI()
    }
    
    
    private func createUI() {
        
        view.backgroundColor = .white
        
        let button = UIButton()
        button.configuration = .filled()
        button.tintColor = .red
        button.setTitle("SecondViewController", for: .normal)
        button.addTarget(self, action: #selector(handleNavigation), for: .touchUpInside)
        
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        
    }
    
    
    @objc func handleNavigation(_ sender: UIButton) {
        let secondViewController = SecondViewController()
        navigationController?.pushViewController(secondViewController, animated: true)
    }
    
}
