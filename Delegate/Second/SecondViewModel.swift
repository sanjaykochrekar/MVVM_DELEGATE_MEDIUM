//
//  SecondViewModel.swift
//  Delegate
//
//  Created by Sanju on 06/11/23.
//

import Foundation


protocol SecondViewModelDelegate: AnyObject {
    func reloadTableView()
}


class SecondViewModel {
    weak var delegate: SecondViewModelDelegate?
    
    var numberList: [String] = []
    
    
    func addNumber() {
        numberList.append("\(Int.random(in: 0...1000))")
        delegate?.reloadTableView()
    }
}
