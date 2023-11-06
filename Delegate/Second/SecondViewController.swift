//
//  SecondViewController.swift
//  Delegate
//
//  Created by Sanju on 06/11/23.
//

import UIKit



class SecondViewController: UIViewController {
    
    var numberList: [String] = []
    var tableView: UITableView!
    
    
    @objc func addNumberPress() {
        numberList.append("\(Int.random(in: 0...1000))")
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    
    deinit {
        print("SecondViewController deinit")
    }
    
    
    override func loadView() {
        super.loadView()
        createUI()
    }
    

    private func createUI() {
        
        view.backgroundColor = .white
        
        tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        tableView.backgroundColor = .white
        view.addSubview(tableView)
        
        
        let fab = UIButton()
        fab.configuration = .filled()
        fab.tintColor = .red
        fab.setTitle("Add Number", for: .normal)
        fab.addTarget(self, action: #selector(addNumberPress), for: .touchUpInside)
        
        view.addSubview(fab)
        
        fab.translatesAutoresizingMaskIntoConstraints = false
        fab.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        fab.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
        
    }
}


// MARK: - UITableViewDataSource Methods
extension SecondViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = numberList[indexPath.row]
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .black
        return cell
    }
    
}
