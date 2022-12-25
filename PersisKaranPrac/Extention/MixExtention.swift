//
//  MixExtention.swift
//  PersisKaranPrac
//
//  Created by kns on 25/12/22.
//

import UIKit

extension NSObject {
    var stringName: String {
        return String(describing: type(of: self))
    }
}

extension UITableView {
    func registerCells(_ cells: [UITableViewCell]) {
        cells.forEach { cell in
            let nib = UINib(nibName: cell.stringName, bundle: nil)
            register(nib, forCellReuseIdentifier: cell.stringName)
        }
    }
}
