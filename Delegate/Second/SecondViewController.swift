//
//  SecondViewController.swift
//  Delegate
//
//  Created by Sanju on 06/11/23.
//

import UIKit



class SecondViewController: UIViewController {
    
    lazy var vm = SecondViewModel()
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vm.delegate = self
    }
    
    @objc func addNumberPress() {
        vm.addNumber()
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
        vm.numberList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = vm.numberList[indexPath.row]
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .black
        return cell
    }
    
}


extension SecondViewController: SecondViewModelDelegate {
    
    func reloadTableView() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
}
